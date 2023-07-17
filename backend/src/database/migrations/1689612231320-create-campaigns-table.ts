import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateCampaignsTable1689612231320 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        CREATE TABLE IF NOT EXISTS campaigns (
            id SERIAL,
            name VARCHAR(255) NOT NULL,
            start_date DATE NOT NULL,
            end_date DATE NOT NULL,
            address VARCHAR(255) NOT NULL,
            description text,
            blood_recipient_facility VARCHAR(255) NOT NULL,
            admin_id INT references administrators(id),
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id)
        );
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        DROP TABLE IF EXISTS campaigns;
    `);
  }
}
