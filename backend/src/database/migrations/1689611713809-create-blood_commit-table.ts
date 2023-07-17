import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateBloodCommitTable1689611713809 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(``
        CREATE TABLE IF NOT EXISTS blood_commits (
            
        )
    )
  }

  public async down(queryRunner: QueryRunner): Promise<void> {}
}
