import 'reflect-metadata';

import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './modules/auth/auth.module';
import { UserModule } from './modules/user/user.module';
import { AuthController } from './modules/auth/auth.controller';
import { DataSource } from 'typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { ApiConfigService } from '@shared/services/api-config.service';
import { SharedModule } from '@shared/services/shared.module';
import { MediaModule } from './modules/media/media.module';
import { DonorsFindingModule } from './modules/donors-finding/donors-finding.module';
import { UserDeviceModule } from './modules/user-device/user-device.module';

@Module({
  imports: [
    AuthModule,
    MediaModule,
    UserModule,
    UserDeviceModule,
    ConfigModule.forRoot({
      isGlobal: true,
      envFilePath: '.env',
    }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule, SharedModule],
      useFactory: (configService: ApiConfigService) =>
        configService.postgresConfig,
      inject: [ApiConfigService, ConfigService],
    }),
    DonorsFindingModule,
  ],
  controllers: [AppController, AuthController],
  providers: [AppService],
})
export class AppModule {
  constructor(private dataSource: DataSource) {}
}
