import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { USER_ROLE } from '@shared/enum/user.enum';
import { User } from 'src/database/entities/user.entity';
import { Repository } from 'typeorm';

@Injectable()
export class UserSeedService {
  constructor(
    @InjectRepository(User)
    private repository: Repository<User>,
  ) {}

  async run() {
    const count = await this.repository.count();

    if (count === 0) {
      await this.repository.save(
        this.repository.create([
          {
            email: 'user1@gmail.com',
            password: '123456',
          },
          {
            email: 'user2@gmail.com',
            password: '123456',
          },
          {
            email: 'admin@gmail.com',
            password: '123456sa',
            role: USER_ROLE.ADMIN,
          },
        ]),
      );
    }
  }
}
