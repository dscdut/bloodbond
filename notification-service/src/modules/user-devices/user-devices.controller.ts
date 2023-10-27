import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Patch,
  Post,
  UseInterceptors,
} from '@nestjs/common';
import MongooseClassSerializerInterceptor from 'src/utils/mongooseClassSerializer.interceptor';
import { UserDevice as UserDeviceModel } from './user-device.schema';
import { UserDevicesService } from './user-devices.service';
import UserDeviceDto from './dto/user-device.dto';
import UpdateDeviceTokenDto from './dto/update-device-token.dto';

@Controller('user-devices')
@UseInterceptors(MongooseClassSerializerInterceptor(UserDeviceModel))
export class UserDevicesController {
  constructor(private readonly userDevicesService: UserDevicesService) {}

  @Get()
  async getAll() {
    return this.userDevicesService.getAll();
  }

  @Get(':userId')
  async getByUserId(@Param('userId') userId: string) {
    return this.userDevicesService.getByUserId(userId);
  }

  @Post()
  async create(@Body() userDeviceDto: UserDeviceDto) {
    return this.userDevicesService.create(userDeviceDto);
  }

  @Patch(':userId')
  async update(
    @Param('userId') userId: string,
    @Body() updateDeviceTokenDto: UpdateDeviceTokenDto,
  ) {
    return this.userDevicesService.update(userId, updateDeviceTokenDto);
  }

  @Delete(':deviceToken')
  async deleteByDeviceToken(@Param('deviceToken') deviceToken: string) {
    return this.userDevicesService.deleteByDeviceToken(deviceToken);
  }
}
