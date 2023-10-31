import { Module } from '@nestjs/common';
import { FcmService } from './fcm.service';
import { FirebaseAdminService } from '../firebase-admin/firebase-admin.service';
import { FcmController } from './fcm.controller';

@Module({
  providers: [FcmService, FirebaseAdminService],
  exports: [FcmService],
  controllers: [FcmController],
})
export class FcmModule {}
