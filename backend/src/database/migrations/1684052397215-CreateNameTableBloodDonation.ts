import { MigrationInterface, QueryRunner } from 'typeorm';

export class CreateNameTableBloodDonation1684052397215
  implements MigrationInterface
{
  name = 'CreateNameTableBloodDonation1684052397215';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `CREATE TABLE "blood_request" ("id" SERIAL NOT NULL, "centerId" character varying, "amount" integer, "requestDate" TIMESTAMP NOT NULL DEFAULT now(), "updatedAt" TIMESTAMP NOT NULL DEFAULT now(), "deletedAt" TIMESTAMP, "userIdId" integer, CONSTRAINT "PK_dde563c617bd6830f54952d61d1" PRIMARY KEY ("id"))`,
    );
    await queryRunner.query(
      `CREATE INDEX "IDX_c04270e214e2029528283addb7" ON "blood_request" ("centerId") `,
    );
    await queryRunner.query(
      `CREATE INDEX "IDX_9e334ae6ae39674722d4ad86ab" ON "blood_request" ("amount") `,
    );
    await queryRunner.query(
      `CREATE TABLE "donation_center" ("id" SERIAL NOT NULL, "email" character varying, "name" character varying, "phone" character varying, "address" character varying, "photoId" character varying, "createAt" TIMESTAMP NOT NULL DEFAULT now(), "updateAt" TIMESTAMP, CONSTRAINT "UQ_c75475a8c967a585ef7d4b4c366" UNIQUE ("email"), CONSTRAINT "PK_b26f796295c3ab98504ba1fe488" PRIMARY KEY ("id"))`,
    );
    await queryRunner.query(
      `CREATE INDEX "IDX_f5593da1ef841f0d20b7d8324e" ON "donation_center" ("name") `,
    );
    await queryRunner.query(
      `CREATE INDEX "IDX_0eb8f51a6a9a65804da7145309" ON "donation_center" ("phone") `,
    );
    await queryRunner.query(
      `CREATE INDEX "IDX_cc0d4a4fab634d8d638c3fb6e6" ON "donation_center" ("address") `,
    );
    await queryRunner.query(
      `CREATE INDEX "IDX_72ab9d6f86985d549c79a0b3c1" ON "donation_center" ("photoId") `,
    );
    await queryRunner.query(
      `CREATE TABLE "test" ("id" SERIAL NOT NULL, "email" character varying, "password" character varying, "provider" character varying NOT NULL DEFAULT 'email', "socialId" character varying, "firstName" character varying, "lastName" character varying, "hash" character varying, "createdAt" TIMESTAMP NOT NULL DEFAULT now(), "updatedAt" TIMESTAMP NOT NULL DEFAULT now(), "deletedAt" TIMESTAMP, "photoId" uuid, "roleId" integer, "statusId" integer, CONSTRAINT "UQ_fa890441710991f23916ba85599" UNIQUE ("email"), CONSTRAINT "PK_5417af0062cf987495b611b59c7" PRIMARY KEY ("id"))`,
    );
    await queryRunner.query(
      `CREATE INDEX "IDX_c5cda6436b33254823717eaff4" ON "test" ("socialId") `,
    );
    await queryRunner.query(
      `CREATE INDEX "IDX_e691b19f57dd335cfcedc76b24" ON "test" ("firstName") `,
    );
    await queryRunner.query(
      `CREATE INDEX "IDX_87d3c9a73856f4239fb9411ac3" ON "test" ("lastName") `,
    );
    await queryRunner.query(
      `CREATE INDEX "IDX_327d106bf608b1f63bf5cbc5d1" ON "test" ("hash") `,
    );
    await queryRunner.query(
      `ALTER TABLE "blood_request" ADD CONSTRAINT "FK_bd3b52c3105cef32a0449aa99c6" FOREIGN KEY ("userIdId") REFERENCES "user"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE "test" ADD CONSTRAINT "FK_0376aecbf6bc30f8a5a3442b8c3" FOREIGN KEY ("photoId") REFERENCES "file"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE "test" ADD CONSTRAINT "FK_ce5f2546a3d412a875a5df4eeed" FOREIGN KEY ("roleId") REFERENCES "role"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
    await queryRunner.query(
      `ALTER TABLE "test" ADD CONSTRAINT "FK_b4c6396f943c6bf3041f21172a6" FOREIGN KEY ("statusId") REFERENCES "status"("id") ON DELETE NO ACTION ON UPDATE NO ACTION`,
    );
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE "test" DROP CONSTRAINT "FK_b4c6396f943c6bf3041f21172a6"`,
    );
    await queryRunner.query(
      `ALTER TABLE "test" DROP CONSTRAINT "FK_ce5f2546a3d412a875a5df4eeed"`,
    );
    await queryRunner.query(
      `ALTER TABLE "test" DROP CONSTRAINT "FK_0376aecbf6bc30f8a5a3442b8c3"`,
    );
    await queryRunner.query(
      `ALTER TABLE "blood_request" DROP CONSTRAINT "FK_bd3b52c3105cef32a0449aa99c6"`,
    );
    await queryRunner.query(
      `DROP INDEX "public"."IDX_327d106bf608b1f63bf5cbc5d1"`,
    );
    await queryRunner.query(
      `DROP INDEX "public"."IDX_87d3c9a73856f4239fb9411ac3"`,
    );
    await queryRunner.query(
      `DROP INDEX "public"."IDX_e691b19f57dd335cfcedc76b24"`,
    );
    await queryRunner.query(
      `DROP INDEX "public"."IDX_c5cda6436b33254823717eaff4"`,
    );
    await queryRunner.query(`DROP TABLE "test"`);
    await queryRunner.query(
      `DROP INDEX "public"."IDX_72ab9d6f86985d549c79a0b3c1"`,
    );
    await queryRunner.query(
      `DROP INDEX "public"."IDX_cc0d4a4fab634d8d638c3fb6e6"`,
    );
    await queryRunner.query(
      `DROP INDEX "public"."IDX_0eb8f51a6a9a65804da7145309"`,
    );
    await queryRunner.query(
      `DROP INDEX "public"."IDX_f5593da1ef841f0d20b7d8324e"`,
    );
    await queryRunner.query(`DROP TABLE "donation_center"`);
    await queryRunner.query(
      `DROP INDEX "public"."IDX_9e334ae6ae39674722d4ad86ab"`,
    );
    await queryRunner.query(
      `DROP INDEX "public"."IDX_c04270e214e2029528283addb7"`,
    );
    await queryRunner.query(`DROP TABLE "blood_request"`);
  }
}
