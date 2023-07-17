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
            name: 'A',
          },
          {
            name: 'B',
          },
          {
            name: 'O',
          },
          {
            name: 'AB',
          },
        ]),
      );
    }
  }
}
