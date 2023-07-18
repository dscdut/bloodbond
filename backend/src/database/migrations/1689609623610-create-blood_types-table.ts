import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateBloodTypesTable1689609623610 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE IF NOT EXISTS blood_types (
            id SERIAL,
            name VARCHAR(10) NOT NULL,
            PRIMARY KEY (id)
        );`,
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query('DROP TABLE IF EXISTS blood_types');
  }
}
