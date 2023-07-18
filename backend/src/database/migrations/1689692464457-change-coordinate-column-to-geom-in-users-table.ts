import { MigrationInterface, QueryRunner } from 'typeorm';

export class ChangeCoordinateColumnToGeomInUsersTable1689692464457
  implements MigrationInterface
{
  name = 'ChangeCoordinateColumnToGeomInUsersTable1689692464457';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      'ALTER TABLE "users" RENAME COLUMN "coordinates" TO "geom"',
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      'ALTER TABLE "users" RENAME COLUMN "geom" TO "coordinates"',
    );
  }
}
