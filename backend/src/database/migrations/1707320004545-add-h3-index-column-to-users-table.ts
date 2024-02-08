import { MigrationInterface, QueryRunner } from 'typeorm';

export class AddH3IndexColumnToUsersTable1707320004545
  implements MigrationInterface
{
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      'ALTER TABLE users ADD COLUMN h3_index VARCHAR(255)',
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query('ALTER TABLE users DROP COLUMN h3_index');
  }
}
