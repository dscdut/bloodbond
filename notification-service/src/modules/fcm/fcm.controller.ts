import { Controller } from '@nestjs/common';
import { FcmService } from './fcm.service';
import { MessagePattern } from '@nestjs/microservices';

@Controller('fcm')
export class FcmController {
  constructor(private readonly fcmService: FcmService) {}

  @MessagePattern({ cmd: 'send-notification' })
  sendNotification({ deviceTokens, title, body }) {
    return this.fcmService.sendNotification(deviceTokens, title, body);
  }
}
