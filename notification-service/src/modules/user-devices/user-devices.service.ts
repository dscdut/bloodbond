import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { UserDevice, UserDeviceDocument } from './user-device.schema';
import { Model } from 'mongoose';
import UserDeviceDto from './dto/user-device.dto';
import UpdateDeviceTokenDto from './dto/update-device-token.dto';

@Injectable()
export class UserDevicesService {
  constructor(
    @InjectModel(UserDevice.name)
    private userDeviceModel: Model<UserDeviceDocument>,
  ) {}

  async getAll() {
    return this.userDeviceModel.find().exec();
  }

  async getByUserId(userId: string) {
    return this.userDeviceModel.find({ userId }).exec();
  }

  async create(userDeviceDto: UserDeviceDto) {
    const createdUserDevice = new this.userDeviceModel(userDeviceDto);
    return createdUserDevice.save();
  }

  async update(userId: string, updateDeviceTokenDto: UpdateDeviceTokenDto) {
    return this.userDeviceModel.findOneAndUpdate(
      { userId },
      updateDeviceTokenDto,
      { new: true }, // This option will return the updated record
    );
  }

  async deleteByDeviceToken(deviceToken: string) {
    await this.userDeviceModel.deleteOne({ deviceToken }).exec();
    return { message: 'User device deleted successfully' };
  }
}
