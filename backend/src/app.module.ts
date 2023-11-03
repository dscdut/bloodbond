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
import { CampaignModule } from './modules/campaign/campaign.module';
import { NotificationTemplateModule } from './modules/notification-template/notification-template.module';
import { I18nModule } from 'nestjs-i18n';
import * as path from 'path';
import { BullModule } from '@nestjs/bull';
import { NotificationRecipientsModule } from './modules/notification-recipients/notification-recipients.module';

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
    CampaignModule,
    I18nModule.forRoot({
      fallbackLanguage: 'en',
      loaderOptions: {
        path: path.join(__dirname, '/i18n/'),
        watch: true,
      },
    }),
    NotificationTemplateModule,
    BullModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => ({
        redis: {
          host: configService.get<string>('REDIS_HOST'),
          port: configService.get<number>('REDIS_PORT'),
        },
      }),
      inject: [ConfigService],
    }),
    NotificationRecipientsModule,
  ],
  controllers: [AppController, AuthController],
  providers: [AppService],
})
export class AppModule {
  constructor(private dataSource: DataSource) {}
}
