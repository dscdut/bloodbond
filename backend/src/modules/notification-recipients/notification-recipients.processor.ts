import { Job, DoneCallback } from 'bull';

import { ConfigService } from '@nestjs/config';
import { config } from 'dotenv';
import { DataSource } from 'typeorm';

config();
const configService = new ConfigService();

const dataSource = new DataSource({
  type: 'postgres',
  host: configService.get('TYPEORM_HOST'),
  port: configService.get('TYPEORM_PORT'),
  username: configService.get('TYPEORM_USERNAME'),
  password: configService.get('TYPEORM_PASSWORD'),
  database: configService.get('TYPEORM_DATABASE'),
  entities: [__dirname + '/../**/*.entity{.ts,.js}'],
});

export default async function (job: Job, cb: DoneCallback) {
  const { notificationId, userIds } = job.data;

  const query = `INSERT INTO notification_recipients (notification_id, recipient_id)
                SELECT ${notificationId}, unnest(ARRAY[${userIds.join(',')}])`;

  if (!dataSource.isInitialized) {
    await dataSource.initialize();
  }

  await dataSource.manager.query(query);
  cb(null, 'Insertion completed');
}
