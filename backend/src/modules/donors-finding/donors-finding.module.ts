import { Module } from '@nestjs/common';
import { DonorsFindingController } from './donors-finding.controller';
import { DonorsFindingService } from './donors-finding.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from '@database/entities';

@Module({
  controllers: [DonorsFindingController],
  providers: [DonorsFindingService],
  imports: [TypeOrmModule.forFeature([User])],
})
export class DonorsFindingModule {}
