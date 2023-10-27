import { Controller, UseInterceptors } from '@nestjs/common';
import MongooseClassSerializerInterceptor from 'src/utils/mongooseClassSerializer.interceptor';
import { UserDevice as UserDeviceModel } from './user-device.schema';
import { UserDevicesService } from './user-devices.service';
import UserDeviceDto from './dto/user-device.dto';
import UpdateDeviceTokenDto from './dto/update-device-token.dto';
import { MessagePattern } from '@nestjs/microservices';

@Controller('user-devices')
@UseInterceptors(MongooseClassSerializerInterceptor(UserDeviceModel))
export class UserDevicesController {
  constructor(private readonly userDevicesService: UserDevicesService) {}

  @MessagePattern({ cmd: 'get-all-user-devices' })
  async getAll() {
    return this.userDevicesService.getAll();
  }

  @MessagePattern({ cmd: 'get-device-by-user-id' })
  async getByUserId(userId: string) {
    return this.userDevicesService.getByUserId(userId);
  }

  @MessagePattern({ cmd: 'create-user-device' })
  async create(userDeviceDto: UserDeviceDto) {
    return this.userDevicesService.create(userDeviceDto);
  }

  @MessagePattern({ cmd: 'update-user-device' })
  async update(updateDeviceTokenDto: UpdateDeviceTokenDto) {
    return this.userDevicesService.update(updateDeviceTokenDto);
  }

  @MessagePattern({ cmd: 'delete-user-device' })
  async deleteByDeviceToken(deviceToken: string) {
    return this.userDevicesService.deleteByDeviceToken(deviceToken);
  }
}
