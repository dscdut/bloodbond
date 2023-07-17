import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateSocialLinksTable1689610816486 implements MigrationInterface {
  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        CREATE TYPE social_links_type AS ENUM ('facebook', 'instagram', 'twitter', 'zalo', 'telegram');

        CREATE TABLE IF NOT EXISTS social_links (
            user_id INT REFERENCES users(id),
            type social_links_type NOT NULL,
            link VARCHAR(255) NOT NULL UNIQUE,
            PRIMARY KEY (user_id, link)
        );
    `);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`
        DROP TYPE IF EXISTS social_links_type;
        DROP TABLE IF EXISTS social_links;
    `);
  }
}
