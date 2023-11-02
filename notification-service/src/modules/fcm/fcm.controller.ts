import { Controller } from '@nestjs/common';
import { FcmService } from './fcm.service';
import { EventPattern, MessagePattern } from '@nestjs/microservices';

@Controller('fcm')
export class FcmController {
  constructor(private readonly fcmService: FcmService) {}

  @MessagePattern({ cmd: 'send-batch-notification' })
  sendBatchNotification({ deviceTokens, title, body }) {
    return this.fcmService.sendBatchNotification(deviceTokens, title, body);
  }

  @EventPattern({ cmd: 'send-notification-to-queue' })
  sendNotificationToQueue({ title, body }) {
    return this.fcmService.sendNotificationToQueue(title, body);
  }
}
