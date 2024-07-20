BEGIN;

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
    "residenceStatus" text,
    "resisdenceAddressLine1" text,
    "residenceTown" text,
    "residenceState" text,
    "residenceLga" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_record" (
    "id" bigserial PRIMARY KEY,
    "bio" text,
    "ninId" bigint NOT NULL,
    "phoneNumber" text,
    "userInfoId" bigint NOT NULL,
    "verifiedAccount" boolean,
    "verifiedEmail" boolean,
    "following" json,
    "followers" json,
    "posts" json,
    "politicalStatus" bigint
);

-- Indexes
CREATE UNIQUE INDEX "user_info_id_unique_idx" ON "user_record" USING btree ("userInfoId");
CREATE UNIQUE INDEX "user_nin_id_unique_idx" ON "user_record" USING btree ("ninId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_record"
    ADD CONSTRAINT "user_record_fk_0"
    FOREIGN KEY("ninId")
    REFERENCES "user_nin_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "user_record"
    ADD CONSTRAINT "user_record_fk_1"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20240715175854410', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240715175854410', "timestamp" = now();

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
