import { Module } from '@nestjs/common';
import { UserDevicesController } from './user-devices.controller';
import { UserDevicesService } from './user-devices.service';
import { MongooseModule } from '@nestjs/mongoose';
import { UserDevice, UserDeviceSchema } from './user-device.schema';
import { BullModule } from '@nestjs/bull';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: UserDevice.name, schema: UserDeviceSchema },
    ]),
    BullModule.registerQueue({
      name: 'userId',
    }),
  ],
  controllers: [UserDevicesController],
  providers: [UserDevicesService],
  exports: [UserDevicesService],
})
export class UserDevicesModule {}
