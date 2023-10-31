import { Module } from '@nestjs/common';
import { DonorsFindingController } from './donors-finding.controller';
import { DonorsFindingService } from './donors-finding.service';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from '@database/entities';
import { ConfigService } from '@nestjs/config';
import { ClientProxyFactory, Transport } from '@nestjs/microservices';
import { NotificationTemplateModule } from '@modules/notification-template/notification-template.module';

@Module({
  controllers: [DonorsFindingController],
  providers: [
    DonorsFindingService,
    {
      provide: 'USER_DEVICES_SERVICE',
      useFactory: (configService: ConfigService) => {
        const user = configService.get('RABBITMQ_USER');
        const password = configService.get('RABBITMQ_PASSWORD');
        const host = configService.get('RABBITMQ_HOST');
        const queueName = configService.get('USER_DEVICES_QUEUE');

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
  imports: [TypeOrmModule.forFeature([User]), NotificationTemplateModule],
})
export class DonorsFindingModule {}
