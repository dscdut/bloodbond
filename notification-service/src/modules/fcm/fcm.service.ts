import { Injectable } from '@nestjs/common';
import { FirebaseAdminService } from '../firebase-admin/firebase-admin.service';
import { RpcException } from '@nestjs/microservices';

@Injectable()
export class FcmService {
  constructor(private readonly firebaseAdminService: FirebaseAdminService) {}

  async sendNotification(deviceTokens: string[], title: string, body: string) {
    const app = this.firebaseAdminService.getFirebaseAdmin();
    const messaging = app.messaging();

    const message = {
      notification: {
        title,
        body,
      },
      tokens: deviceTokens,
    };

    try {
      const batchSendMessageResponse = await messaging.sendEachForMulticast(
        message,
      );
      const failedTokens = [];

      batchSendMessageResponse.responses.forEach((resp, idx) => {
        if (resp.error) {
          failedTokens.push(deviceTokens[idx]);
        }
      });

      return batchSendMessageResponse;
    } catch (error) {
      throw new RpcException(error);
    }
  }
}
