import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateUsersTable1689610185325 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        CREATE TABLE IF NOT EXISTS users (
            id SERIAL,
            name VARCHAR(255) NOT NULL,
            avatar VARCHAR(255),
            email VARCHAR(255) NOT NULL UNIQUE,
            password VARCHAR(255) NOT NULL,
            birthdate DATE,
            phone_number VARCHAR(20) UNIQUE,
            citizenship_number VARCHAR(50) UNIQUE,
            blood_type_id INT REFERENCES blood_types(id),
            address VARCHAR(255),
            coordinates geometry(Point, 4326),
            refresh_token text[],
            created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id)
        );
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`DROP TABLE IF EXISTS users`);
  }
}
