import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateEventsTable1698222108341 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        CREATE TABLE IF NOT EXISTS events (
            id SERIAL,
            entity_type SMALLINT NOT NULL,
            entity_id INT NOT NULL,
            event_type SMALLINT NOT NULL,
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id)
        );
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        DROP TABLE IF EXISTS events;
    `);
  }
}
