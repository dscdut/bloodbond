import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateBloodCommitsTable1689611788916
  implements MigrationInterface
{
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        CREATE TABLE IF NOT EXISTS blood_commits (
            id SERIAL,
            donor_id INT REFERENCES users(id),
            recipient_id INT REFERENCES users(id),
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            status INT NOT NULL DEFAULT 0,
            PRIMARY KEY (id)
        );
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        DROP TABLE IF EXISTS blood_commits;
    `);
  }
}
