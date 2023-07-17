import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateAdministratorsTable1689611984197
  implements MigrationInterface
{
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        CREATE TABLE IF NOT EXISTS administrators (
            id SERIAL,
            email VARCHAR(255) NOT NULL UNIQUE,
            username VARCHAR(255) NOT NULL UNIQUE,
            password VARCHAR(255) NOT NULL,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            role INT NOT NULL DEFAULT 0,
            PRIMARY KEY (id)
        );
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        DROP TABLE IF EXISTS administrators;
    `);
  }
}
