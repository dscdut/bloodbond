import { PageDto } from '@core/pagination/dto/page.dto';
import { User } from '@database/entities';
import { AuthCredentialDto } from '@modules/auth/dto/auth-credential.dto';
import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { PageMetaDto } from '@core/pagination/dto/page-meta.dto';
import { PaginateTransformDto } from '../../core/pagination/dto/paginate-transformer.dto';
import { PaginateQueryBuilder } from '@core/pagination/query/query-builder';

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

  async updateOne(id: number, data: Partial<User>): Promise<User> {
    return this.userRepository.save(
      this.userRepository.create({
        id,
        ...data,
      }),
    );
  }

  async findOneById(id: number): Promise<User> {
    return this.userRepository.findOneBy({ id });
  }

  async findOne(options: Record<string, any>): Promise<User> {
    return this.userRepository.findOneBy(options);
  }
}
