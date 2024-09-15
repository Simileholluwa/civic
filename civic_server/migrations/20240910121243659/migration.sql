BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "postType" bigint NOT NULL,
    "text" text NOT NULL,
    "imageUrls" json NOT NULL,
    "videoUrl" text NOT NULL,
    "taggedUsers" json NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL
);

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
    "ownerId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "owner_id_unique_idx" ON "user_nin_record" USING btree ("ownerId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_record" (
    "id" bigserial PRIMARY KEY,
    "bio" text NOT NULL,
    "nin" text,
    "phoneNumber" text,
    "userInfoId" bigint NOT NULL,
    "verifiedAccount" boolean NOT NULL,
    "following" json NOT NULL,
    "followers" json NOT NULL,
    "politicalStatus" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_info_id_unique_idx" ON "user_record" USING btree ("userInfoId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_nin_record"
    ADD CONSTRAINT "user_nin_record_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_record"
    ADD CONSTRAINT "user_record_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20240910121243659', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240910121243659', "timestamp" = now();

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
