import { Campaign } from '@database/entities/campaign.entity';
import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateCampaignDto } from './dto/create-campaign.dto';
import { CreatedCampaignResponse } from './response/create-campaign.response';
import { UpdateCampaignDto } from './dto/update-campaign.dto';
import { UpdatedCampaignResponse } from './response/update-campaign.response';

@Injectable()
export class CampaignService {
  constructor(
    @InjectRepository(Campaign)
    private campaignRepository: Repository<Campaign>,
  ) {}

  async findAll(): Promise<Campaign[]> {
    return this.campaignRepository.find();
  }

  async findOne(id: number): Promise<Campaign> {
    const campaign = await this.campaignRepository.findOneBy({ id });

    if (!campaign) {
      throw new NotFoundException('Campaign not found');
    }

    return campaign;
  }

  async createOne(
    createCampaignDto: CreateCampaignDto,
  ): Promise<CreatedCampaignResponse> {
    if (createCampaignDto.startDate > createCampaignDto.endDate) {
      throw new BadRequestException('Start date must be before end date');
    }

    const campaign = this.campaignRepository.create(createCampaignDto);
    return this.campaignRepository.save(campaign);
  }

  async updateOne(
    id: number,
    updateCampaignDto: UpdateCampaignDto,
  ): Promise<UpdatedCampaignResponse> {
    const campaign = await this.campaignRepository.findOne({
      where: { id },
    });
    if (!campaign) {
      throw new NotFoundException('Campaign not found');
    }

    if (updateCampaignDto.startDate > updateCampaignDto.endDate) {
      throw new BadRequestException('Start date must be before end date');
    }

    const updatedCampaign = await this.campaignRepository.save({
      ...campaign,
      ...updateCampaignDto,
    });

    return updatedCampaign;
  }

  async deleteOne(id: number): Promise<Campaign> {
    const campaign = await this.campaignRepository.findOne({
      where: { id },
    });
    if (!campaign) {
      throw new NotFoundException('Campaign not found');
    }
    return this.campaignRepository.remove(campaign);
  }
}
