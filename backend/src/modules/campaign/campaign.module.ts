import { Module } from '@nestjs/common';
import { CampaignController } from './campaign.controller';
import { CampaignService } from './campaign.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Campaign } from '@database/entities/campaign.entity';
import { ConfigService } from '@nestjs/config';
import { ClientProxyFactory, Transport } from '@nestjs/microservices';
import { NotificationTemplateModule } from '@modules/notification-template/notification-template.module';

@Module({
  imports: [TypeOrmModule.forFeature([Campaign]), NotificationTemplateModule],
  controllers: [CampaignController],
  providers: [
    CampaignService,
    {
      provide: 'NOTIFICATION_SERVICE',
      useFactory: (configService: ConfigService) => {
        const user = configService.get('RABBITMQ_USER');
        const password = configService.get('RABBITMQ_PASSWORD');
        const host = configService.get('RABBITMQ_HOST');
        const queueName = configService.get('NOTIFICATION_QUEUE');

        return ClientProxyFactory.create({
          transport: Transport.RMQ,
          options: {
            urls: [`amqp://${user}:${password}@${host}`],
            queue: queueName,
            queueOptions: {
              durable: true,
            },
          },
        });
      },
      inject: [ConfigService],
    },
  ],
})
export class CampaignModule {}
