import { Module } from '@nestjs/common';
import { FcmService } from './fcm.service';
import { FirebaseAdminService } from '../firebase-admin/firebase-admin.service';
import { FcmController } from './fcm.controller';
import { BullModule } from '@nestjs/bull';
import { UserDevicesModule } from '../user-devices/user-devices.module';
import { PushNotificationProcessor } from './push-notification.processor';

@Module({
  imports: [
    BullModule.registerQueue({
      name: 'notification:push',
    }),
    UserDevicesModule,
  ],
  controllers: [FcmController],
  providers: [FcmService, FirebaseAdminService, PushNotificationProcessor],
  exports: [FcmService],
})
export class FcmModule {}
