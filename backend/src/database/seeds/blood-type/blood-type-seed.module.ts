import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { BloodType } from 'src/database/entities/blood_type.entity';
import { BloodTypeSeedService } from './blood-type-seed.service';

@Module({
  imports: [TypeOrmModule.forFeature([BloodType])],
  providers: [BloodTypeSeedService],
  exports: [BloodTypeSeedService],
})
export class BloodTypeSeedModule {}
