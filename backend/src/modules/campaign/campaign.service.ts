import { Campaign } from '@database/entities/campaign.entity';
import {
  BadRequestException,
  HttpException,
  HttpStatus,
  Inject,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateCampaignDto } from './dto/create-campaign.dto';
import { CreatedCampaignResponse } from './response/create-campaign.response';
import { UpdateCampaignDto } from './dto/update-campaign.dto';
import { UpdatedCampaignResponse } from './response/update-campaign.response';
import { ClientProxy } from '@nestjs/microservices';
import { NotificationTemplateService } from '@modules/notification-template/notification-template.service';
import { catchError } from 'rxjs';
import { Event } from '@database/entities/event.entity';
import { ENTITY_TYPE } from '@shared/enum/events/entity-type.enum';
import { EVENT_TYPE } from '@shared/enum/events/event-type.enum';
import { Notification } from '@database/entities/notification.entity';

@Injectable()
export class CampaignService {
  constructor(
    @InjectRepository(Campaign)
    private campaignRepository: Repository<Campaign>,
    @Inject('NOTIFICATION_SERVICE') private notificationService: ClientProxy,
    private readonly notificationTemplateService: NotificationTemplateService,
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
    const createdCampaign = await this.campaignRepository.save(campaign);

    const notificationContent =
      this.notificationTemplateService.sendCampaignCreatedNotification(
        createdCampaign.name,
      );

    const event = new Event();
    event.entityType = ENTITY_TYPE.CAMPAIGN;
    event.entityId = createdCampaign.id;
    event.eventType = EVENT_TYPE.CAMPAIGN_CREATED;
    const createdEvent = await event.save();

    const notification = new Notification();
    notification.event = createdEvent;
    notification.content = notificationContent.body;
    const createdNotification = await notification.save();

    this.notificationService
      .emit(
        { cmd: 'send-notification-recipient-to-queue' },
        createdNotification.id,
      )
      .pipe(
        catchError((error) => {
          throw new HttpException(error.message, HttpStatus.BAD_REQUEST);
        }),
      )
      .subscribe();

    this.notificationService
      .emit({ cmd: 'send-notification-to-queue' }, notificationContent)
      .pipe(
        catchError((error) => {
          throw new HttpException(error.message, HttpStatus.BAD_REQUEST);
        }),
      )
      .subscribe();

    return createdCampaign;
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
