import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import type { TypeOrmModuleOptions } from '@nestjs/typeorm';
import fs from 'fs';
import entities from '../../database/entities';
import { config } from 'dotenv';

config();
@Injectable()
export class ApiConfigService {
  constructor(private configService: ConfigService) {}

  get isDevelopment(): boolean {
    return this.nodeEnv === 'development';
  }

  get isProduction(): boolean {
    return this.nodeEnv === 'production';
  }

  get isTest(): boolean {
    return this.nodeEnv === 'test';
  }

  get nodeEnv(): string {
    return this.configService.get('NODE_ENV');
  }

  get postgresConfig(): TypeOrmModuleOptions {
    return {
      type: 'postgres',
      host: this.configService.get('TYPEORM_HOST'),
      port: this.configService.get<number>('TYPEORM_PORT'),
      username: this.configService.get('TYPEORM_USERNAME'),
      password: this.configService.get('TYPEORM_PASSWORD'),
      database: this.configService.get('TYPEORM_DATABASE'),
      entities,
      autoLoadEntities: true,
      synchronize: false,
      maxQueryExecutionTime:
        this.configService.get<number>('DB_MAX_QUERY_TIME'),
      ssl:
        this.configService.get('DB_USE_SSL') === 'true'
          ? {
              ca: fs.readFileSync('ca-certificate.crt'),
            }
          : undefined,
    };
  }

  get authConfig() {
    return {
      secret: this.configService.get('JWT_SECRET'),
      expiresIn: this.configService.get('JWT_EXPIRES_IN'),
    };
  }
}
