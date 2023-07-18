import { PageDto } from '@core/pagination/dto/page.dto';
import { User } from '@database/entities';
import { AuthCredentialDto } from '@modules/auth/dto/auth-credential.dto';
import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { PageMetaDto } from '@core/pagination/dto/page-meta.dto';
import { PaginateTransformDto } from '../../core/pagination/dto/paginate-transformer.dto';
import { PaginateQueryBuilder } from '@core/pagination/query/query-builder';
import { UpdateUserDto } from './dto/update-user.dto';
import { UpdatedUserResponse } from './response/update-user.response';
import { BloodType } from '@database/entities/blood_type.entity';

@Injectable()
export class UserService {
  constructor(
    @InjectRepository(User)
    private userRepository: Repository<User>,
  ) {}

  async findAll(
    paginateTransformDto: PaginateTransformDto,
  ): Promise<PageDto<User>> {
    const queryBuilder = this.userRepository.createQueryBuilder('user');

    const paginateQueryBuilder = PaginateQueryBuilder.builder<User>(
      queryBuilder,
      paginateTransformDto,
    );

    const itemCount = (await paginateQueryBuilder.itemCount().run()) as number;
    paginateQueryBuilder.itemCount().clearJoin();
    const data = (await paginateQueryBuilder.data().run()) as User[];

    const pageMetaDto = new PageMetaDto({ itemCount, paginateTransformDto });
    return new PageDto(data, pageMetaDto);
  }

  async getMe(id: number): Promise<Partial<User>> {
    const foundUser = await this.userRepository.findOneByOrFail({ id });
    delete foundUser.password;
    return foundUser;
  }

  async createOne(data: User | AuthCredentialDto): Promise<User> {
    const isUserExisted = await this.userRepository.findOneBy({
      email: data.email,
    });
    if (isUserExisted) {
      throw new NotFoundException('User is existed');
    }
    const user = this.userRepository.create(data);
    return this.userRepository.save(user);
  }

  async updateOne(
    id: number,
    updateUserDto: UpdateUserDto,
  ): Promise<UpdatedUserResponse> {
    const user = await this.userRepository.findOneBy({ id });
    if (!user) {
      throw new NotFoundException('User not found');
    }

    const { longitude, latitude, bloodTypeId, ...rest } = updateUserDto;

    let updateData: any = {
      ...rest,
    };

    if (longitude && latitude) {
      updateData = {
        ...updateData,
        geom: () => `ST_SETSRID(ST_MAKEPOINT(${longitude}, ${latitude}), 4326)`,
      };
    }

    const bloodType = await BloodType.findOneBy({ id: bloodTypeId });
    if (!bloodType) {
      throw new NotFoundException('Blood type not found');
    } else {
      updateData = {
        ...updateData,
        bloodTypeId,
      };
    }

    const query = this.userRepository
      .createQueryBuilder('user')
      .update(User)
      .set(updateData)
      .where('id = :id', { id })
      .returning('*')
      .execute();

    return query.then((data) => {
      console.log(data.raw[0]);
      const {
        id,
        name,
        email,
        avatar,
        birthdate,
        phone_number,
        citizenship_number,
        address,
        created_at,
        updated_at,
      } = data.raw[0];

      return {
        id,
        name,
        email,
        avatar,
        birthdate,
        phoneNumber: phone_number,
        citizenshipNumber: citizenship_number,
        bloodType: bloodType,
        address,
        createdAt: created_at,
        updatedAt: updated_at,
      };
    });
  }

  async findOneById(id: number): Promise<User> {
    return this.userRepository.findOneBy({ id });
  }

  async findOne(options: Record<string, any>): Promise<User> {
    return this.userRepository.findOneBy(options);
  }
}
