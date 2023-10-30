import { Module } from '@nestjs/common';
import { NotificationTemplateService } from './notification-template.service';

@Module({
  providers: [NotificationTemplateService],
  exports: [NotificationTemplateService],
})
export class NotificationTemplateModule {}
