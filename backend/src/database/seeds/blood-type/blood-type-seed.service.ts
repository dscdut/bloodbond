import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { BloodType } from 'src/database/entities/blood_type.entity';
import { Repository } from 'typeorm';

@Injectable()
export class BloodTypeSeedService {
  constructor(
    @InjectRepository(BloodType)
    private repository: Repository<BloodType>,
  ) {}

  async run() {
    const count = await this.repository.count();

    if (count === 0) {
      await this.repository.save(
        this.repository.create([
          {
            id: 1,
            name: 'A',
          },
          {
            id: 2,
            name: 'B',
          },
          {
            id: 3,
            name: 'O',
          },
          {
            id: 4,
            name: 'AB',
          },
        ]),
      );
    }
  }
}
