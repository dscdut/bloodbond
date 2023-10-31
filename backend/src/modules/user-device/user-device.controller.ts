import {
  Body,
  ClassSerializerInterceptor,
  Controller,
  HttpCode,
  HttpException,
  HttpStatus,
  Inject,
  Patch,
  Post,
  UseInterceptors,
} from '@nestjs/common';
import { ClientProxy } from '@nestjs/microservices';
import { ApiOperation } from '@nestjs/swagger';
import { catchError } from 'rxjs';
import UserDeviceDto from './dto/user-device.dto';
import UpdateDeviceTokenDto from './dto/update-device-token.dto';
import { AuthenticateGuard } from '@modules/auth/guard/roles.decorator';
import { CurrentUser } from '@shared/decorator/user.decorator';

@Controller('user-device')
@UseInterceptors(ClassSerializerInterceptor)
export class UserDeviceController {
  constructor(
    @Inject('USER_DEVICES_SERVICE') private userDeviceService: ClientProxy,
  ) {}

  @Post()
  @AuthenticateGuard()
  @HttpCode(HttpStatus.CREATED)
  @ApiOperation({
    tags: ['user-device'],
    operationId: 'createUserDevice',
    summary: 'Create user device',
    description: 'Create user device',
  })
  async create(
    @CurrentUser('id') userId: string,
    @Body() userDeviceDto: UserDeviceDto,
  ) {
    return this.userDeviceService
      .send(
        {
          cmd: 'create-user-device',
        },
        { userId, ...userDeviceDto },
      )
      .pipe(
        catchError((err) => {
          throw new HttpException(err.message, HttpStatus.BAD_REQUEST);
        }),
      );
  }

  @Patch()
  @AuthenticateGuard()
  @HttpCode(HttpStatus.OK)
  @ApiOperation({
    tags: ['user-device'],
    operationId: 'updateUserDevice',
    summary: 'Update user device',
    description: 'Update user device',
  })
  async update(
    @CurrentUser('id') userId: string,
    @Body() updateUserDeviceDto: UpdateDeviceTokenDto,
  ) {
    return this.userDeviceService
      .send(
        {
          cmd: 'update-user-device',
        },
        { userId, ...updateUserDeviceDto },
      )
      .pipe(
        catchError((err) => {
          throw new HttpException(err.message, HttpStatus.BAD_REQUEST);
        }),
      );
  }
}
