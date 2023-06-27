import { NullableType } from './../../shared/types/nullable.type';
import { UserService } from '@modules/user/user.service';
import {
  Injectable,
  HttpStatus,
  UnauthorizedException,
  HttpException,
} from '@nestjs/common';
import { AuthCredentialDto } from './dto/auth-credential.dto';
import { JwtService } from '@nestjs/jwt';
import { RegisterResponse } from './response/register.response';
import { User } from '@database/entities';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import * as argon2 from 'argon2';
import { LoginResponse } from './response/login.response';
import { OAuth2Client } from 'google-auth-library';
import { ConfigService } from '@nestjs/config';
import { AuthGoogleLoginDto } from './dto/auth-google-login.dto';
import { SocialInterface } from './interface/social.interface';
import { USER_ROLE } from '@shared/enum/user.enum';
@Injectable()
export class AuthService {
  private google: OAuth2Client;

  constructor(
    private userService: UserService,
    private jwtService: JwtService,
    private configService: ConfigService,

    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {
    this.google = new OAuth2Client(
      configService.get('GOOGLE_CLIENT_ID'),
      configService.get('GOOGLE_CLIENT_SECRET'),
      configService.get('GOOGLE_CALLBACK_URL'),
    );
  }

  async registerUser(
    authCredentialDto: AuthCredentialDto,
  ): Promise<RegisterResponse> {
    const user = await this.userService.createOne(authCredentialDto);
    return {
      id: user.id,
      email: user.email,
    };
  }

  async login(user: User) {
    const payload = { email: user.email, userId: user.id };
    return {
      email: user.email,
      token: this.jwtService.sign(payload),
      role: user.role,
    };
  }

  async validateAndGetUser(
    authCredentialDto: AuthCredentialDto,
  ): Promise<User> {
    const { email, password } = authCredentialDto;
    const isUserExisted = await this.userRepository.findOneBy({
      email,
    });
    if (!isUserExisted) {
      throw new UnauthorizedException('email or password is incorrect');
    }

    const isValidPassword = await argon2.verify(
      isUserExisted.password,
      password,
    );

    if (!isValidPassword) {
      throw new UnauthorizedException('email or password is incorrect');
    }

    return isUserExisted;
  }

  async getProfileByToken(
    loginDto: AuthGoogleLoginDto,
  ): Promise<SocialInterface> {
    const ticket = await this.google.verifyIdToken({
      idToken: loginDto.idToken,
      audience: [
        this.configService.getOrThrow('GOOGLE_CLIENT_ID', { infer: true }),
      ],
    });

    const data = ticket.getPayload();

    if (!data) {
      throw new HttpException(
        {
          status: HttpStatus.UNPROCESSABLE_ENTITY,
          errors: {
            user: 'wrongToken',
          },
        },
        HttpStatus.UNPROCESSABLE_ENTITY,
      );
    }

    return {
      id: data.sub,
      email: data.email,
    };
  }

  async validateSocialLogin(
    authProvider: string,
    socialData: SocialInterface,
  ): Promise<LoginResponse> {
    let user: NullableType<User>;
    const socialEmail = socialData.email?.toLowerCase();

    const userByEmail = await this.userService.findOne({
      email: socialEmail,
    });

    // eslint-disable-next-line prefer-const
    user = await this.userService.findOne({
      social_id: socialData.id,
      provider: authProvider,
    });

    if (user) {
      if (socialEmail && !userByEmail) {
        user.email = socialEmail;
      }

      await this.userService.updateOne(user.id, user);
    } else if (userByEmail) {
      user = userByEmail;
    } else {
      user = await this.userService.createOne({
        email: socialEmail,
        social_id: socialData.id,
        provider: authProvider,
        role: USER_ROLE.USER,
      });

      user = await this.userService.findOne({
        id: user.id,
      });
    }

    if (!user) {
      throw new HttpException(
        {
          status: HttpStatus.UNPROCESSABLE_ENTITY,
          errors: {
            user: 'userNotFound',
          },
        },
        HttpStatus.UNPROCESSABLE_ENTITY,
      );
    }

    const jwtToken = this.jwtService.sign({
      id: user.id,
      role: user.role,
    });

    return {
      email: user.email,
      token: jwtToken,
      role: user.role,
    };
  }
}
