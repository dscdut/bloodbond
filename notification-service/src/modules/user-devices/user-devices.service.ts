import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { UserDevice, UserDeviceDocument } from './user-device.schema';
import { Model } from 'mongoose';
import UserDeviceDto from './dto/user-device.dto';
import UpdateDeviceTokenDto from './dto/update-device-token.dto';
import { RpcException } from '@nestjs/microservices';

@Injectable()
export class UserDevicesService {
  constructor(
    @InjectModel(UserDevice.name)
    private userDeviceModel: Model<UserDeviceDocument>,
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

  async create(userDeviceDto: UserDeviceDto) {
    const createdUserDevice = new this.userDeviceModel(userDeviceDto);
    return createdUserDevice.save();
  }

  async update(updateDeviceTokenDto: UpdateDeviceTokenDto) {
    const { userId, ...payload } = updateDeviceTokenDto;

    // find user device by userId and update deviceToken

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
}
