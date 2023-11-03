import { Module } from '@nestjs/common';
import { NotificationRecipientsService } from './notification-recipients.service';
import { BullModule } from '@nestjs/bull';
import { join } from 'path';
import { TypeOrmModule } from '@nestjs/typeorm';
import { NotificationRecipient } from '@database/entities/notification_recipient.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([NotificationRecipient]),
    BullModule.registerQueue({
      name: 'userId',
      processors: [
        {
          name: 'batch-insert',
          path: join(__dirname, 'notification-recipients.processor.js'),
        },
      ],
    }),
  ],
  providers: [NotificationRecipientsService],
  exports: [NotificationRecipientsService],
})
export class NotificationRecipientsModule {}
