BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "user_nin_record" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_nin_record" (
    "id" bigserial PRIMARY KEY,
    "firstName" text,
    "surname" text,
    "telephone" text,
    "photoUrl" text,
    "birthdate" text,
    "email" text,
    "gender" text,
    "ninNumber" text,
    "residenceStatus" text,
    "resisdenceAddressLine1" text,
    "residenceTown" text,
    "residenceState" text,
    "residenceLga" text,
    "userInfoId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_record_id_unique_idx" ON "user_nin_record" USING btree ("userInfoId");

--
-- ACTION ALTER TABLE
--
DROP INDEX "user_nin_id_unique_idx";
ALTER TABLE "user_record" DROP CONSTRAINT "user_record_fk_1";
ALTER TABLE "user_record" DROP CONSTRAINT "user_record_fk_0";
ALTER TABLE "user_record" DROP COLUMN "ninId";
ALTER TABLE "user_record" ADD COLUMN "nin" text;
ALTER TABLE ONLY "user_record"
    ADD CONSTRAINT "user_record_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_nin_record"
    ADD CONSTRAINT "user_nin_record_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20240715192727833', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240715192727833', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20240520102713718', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240520102713718', "timestamp" = now();


COMMIT;
