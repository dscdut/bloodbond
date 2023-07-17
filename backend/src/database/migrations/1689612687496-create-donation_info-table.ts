import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateDonationInfoTable1689612687496
  implements MigrationInterface
{
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        CREATE TABLE IF NOT EXISTS donation_info (
            id SERIAL,
            donor_id INT references users(id),
            donation_date DATE NOT NULL,
            amount INT NOT NULL,
            campaign_id INT references campaigns(id),
            status INT NOT NULL DEFAULT 0,
            admin_id INT references administrators(id),
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id)    
        );
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        DROP TABLE IF EXISTS donation_info;
    `);
  }
}
