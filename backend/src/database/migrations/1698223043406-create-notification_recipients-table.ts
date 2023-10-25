import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateNotificationRecipientsTable1698223043406
  implements MigrationInterface
{
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        CREATE TABLE IF NOT EXISTS notification_recipients (
            notification_id INT NOT NULL,
            recipient_id INT NOT NULL,
            read_at TIMESTAMP WITH TIME ZONE DEFAULT NULL,
            channels JSONB NOT NULL DEFAULT '[]',
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (notification_id, recipient_id),
            FOREIGN KEY (notification_id) REFERENCES notifications (id) ON DELETE RESTRICT,
            FOREIGN KEY (recipient_id) REFERENCES users (id) ON DELETE RESTRICT
        );
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        DROP TABLE IF EXISTS notification_recipients;
    `);
  }
}
