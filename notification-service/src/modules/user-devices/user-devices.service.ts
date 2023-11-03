import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { UserDevice, UserDeviceDocument } from './user-device.schema';
import { Model } from 'mongoose';
import UserDeviceDto from './dto/user-device.dto';
import UpdateDeviceTokenDto from './dto/update-device-token.dto';
import { RpcException } from '@nestjs/microservices';
import { InjectQueue } from '@nestjs/bull';
import { Queue } from 'bull';

@Injectable()
export class UserDevicesService {
  constructor(
    @InjectModel(UserDevice.name)
    private userDeviceModel: Model<UserDeviceDocument>,
    @InjectQueue('userId') private userIdsQueue: Queue,
  ) {}

  async getAll() {
    return this.userDeviceModel.find().lean();
  }

  async getByUserId(userId: string) {
    const deviceToken = await this.userDeviceModel.findOne({ userId }).lean();

    if (!deviceToken) {
      throw new RpcException('User device not found');
    }

    return deviceToken;
  }

  async getManyByUserIds(userIds: string[]) {
    return this.userDeviceModel.find({ userId: { $in: userIds } }).lean();
  }

  async create(userDeviceDto: UserDeviceDto) {
    // check if user id already exists
    const userDevice = await this.userDeviceModel
      .findOne({ userId: userDeviceDto.userId })
      .lean();

    if (userDevice) {
      throw new RpcException('User device already exists');
    }

    const createdUserDevice = new this.userDeviceModel(userDeviceDto);
    return createdUserDevice.save();
  }

  async update(updateDeviceTokenDto: UpdateDeviceTokenDto) {
    const { userId, ...payload } = updateDeviceTokenDto;
    const updatedDevice = await this.userDeviceModel
      .findOneAndUpdate({ userId }, payload, { new: true })
      .lean();

    if (!updatedDevice) {
      throw new RpcException('User device not found');
    }

    return updatedDevice;
  }

  async deleteByDeviceToken(deviceToken: string) {
    const deletedDevice = await this.userDeviceModel
      .findOneAndDelete({ deviceToken })
      .exec();

    if (!deletedDevice) {
      throw new RpcException('User device not found');
    }

    return { message: 'User device deleted successfully' };
  }

  async deleteByDeviceTokens(deviceTokens: string[]) {
    const deletedDevices = await this.userDeviceModel
      .deleteMany({ deviceToken: { $in: deviceTokens } })
      .exec();

    if (!deletedDevices) {
      throw new RpcException('User devices not found');
    }

    return { message: 'User devices deleted successfully' };
  }

  async sendNotificationRecipientToQueue(notificationId: number) {
    const userDevices = await this.userDeviceModel.find().lean();
    const userIds = userDevices.reduce((acc: string[], each: UserDevice) => {
      const { notification } = each.settings;
      if (notification.push) {
        acc.push(each.userId);
      }
      return acc;
    }, []);

    const batchSize = 500;
    const totalBatches = Math.ceil(userIds.length / batchSize);

    for (let i = 0; i < totalBatches; i++) {
      const start = i * batchSize;
      const end = (i + 1) * batchSize;
      const batchUserIds = userIds.slice(start, end);

      const message = {
        notificationId,
        userIds: batchUserIds,
      };

      try {
        await this.userIdsQueue.add('batch-insert', message);
      } catch (error) {
        throw new RpcException(error);
      }
    }

    return { notificationId, userIds };
  }
}
