import { Process, Processor } from '@nestjs/bull';
import { Job } from 'bull';
import { PushNotificationType } from './types/push-notification.type';
import { FcmService } from './fcm.service';

@Processor('notification:push')
export class PushNotificationProcessor {
  constructor(private readonly fcmService: FcmService) {}

  @Process('batch-notification')
  async sendNotificationFromQueue(job: Job<PushNotificationType>) {
    const { notification, tokens } = job.data;
    const { title, body } = notification;

    await this.fcmService.sendBatchNotification(tokens, title, body);
  }
}
