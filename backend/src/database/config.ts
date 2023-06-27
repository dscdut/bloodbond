import fs from 'fs';
import { DataSource } from 'typeorm';
import { ConfigService } from '@nestjs/config';
import { config } from 'dotenv';
import entities from './entities';

config();
const configService = new ConfigService();

export const dataSource = new DataSource({
  type: 'postgres',
  host: configService.get('TYPEORM_HOST'),
  port: configService.get<number>('TYPEORM_PORT'),
  username: configService.get('TYPEORM_USERNAME'),
  password: configService.get('TYPEORM_PASSWORD'),
  database: configService.get('TYPEORM_DATABASE'),
  entities,
  ssl:
    configService.get('DB_USE_SSL') === 'true'
      ? {
          ca: fs.readFileSync('ca-certificate.crt'),
        }
      : undefined,
  migrations: ['src/database/migrations/*.ts'],
});
