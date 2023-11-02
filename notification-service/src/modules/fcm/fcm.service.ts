import { Injectable } from '@nestjs/common';
import { FirebaseAdminService } from '../firebase-admin/firebase-admin.service';
import { RpcException } from '@nestjs/microservices';
import { InjectQueue } from '@nestjs/bull';
import { Queue } from 'bull';
import { UserDevicesService } from '../user-devices/user-devices.service';
import { UserDevice } from '../user-devices/user-device.schema';

@Injectable()
export class FcmService {
  constructor(
    private readonly firebaseAdminService: FirebaseAdminService,
    private readonly userDeviceService: UserDevicesService,
    @InjectQueue('notification:push')
    private sendNotificationQueue: Queue,
  ) {}

  async sendBatchNotification(
    deviceTokens: string[],
    title: string,
    body: string,
  ) {
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

      if (failedTokens.length > 0) {
        await this.userDeviceService.deleteByDeviceTokens(failedTokens);
      }
    } catch (error) {
      throw new RpcException(error);
    }
  }

  async sendNotificationToQueue(title: string, body: string) {
    const userDevices = await this.userDeviceService.getAll();
    const deviceTokens = userDevices.reduce(
      (acc: string[], each: UserDevice) => {
        const { notification } = each.settings;
        if (notification.push) {
          acc.push(each.deviceToken);
        }
        return acc;
      },
      [],
    );

    const batchSize = 500;
    const totalBatches = Math.ceil(deviceTokens.length / batchSize);

    for (let i = 0; i < totalBatches; i++) {
      const start = i * batchSize;
      const end = (i + 1) * batchSize;
      const batchTokens = deviceTokens.slice(start, end);

      const message = {
        notification: {
          title,
          body,
        },
        tokens: batchTokens,
      };

      try {
        await this.sendNotificationQueue.add('batch-notification', message);
      } catch (error) {
        throw new RpcException(error);
      }
    }
  }
}
