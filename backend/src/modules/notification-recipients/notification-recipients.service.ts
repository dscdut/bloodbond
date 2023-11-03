import { NotificationRecipient } from '@database/entities/notification_recipient.entity';
import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateNotificationRecipientDto } from './dto/create-notification-recipient.dto';

@Injectable()
export class NotificationRecipientsService {
  constructor(
    @InjectRepository(NotificationRecipient)
    private notificationRecipientRepository: Repository<NotificationRecipient>,
  ) {}

  async bulkInsert(
    notificationId: number,
    notificationRecipients: CreateNotificationRecipientDto[],
  ) {
    const query = `INSERT INTO notification_recipients (notification_id, recipient_id)
      SELECT ${notificationId}, unnest(ARRAY[${notificationRecipients
      .map((recipient) => recipient.userId)
      .join(',')}])`;

    await this.notificationRecipientRepository.query(query);
  }
}
