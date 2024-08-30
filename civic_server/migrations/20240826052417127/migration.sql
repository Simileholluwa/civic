BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "draft_post" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "postType" bigint,
    "text" text NOT NULL,
    "imageUrls" json NOT NULL,
    "videoUrl" text NOT NULL,
    "taggedUsers" json NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL
);

--
-- ACTION DROP TABLE
--
DROP TABLE "post" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "postType" bigint,
    "text" text NOT NULL,
    "imageUrls" json NOT NULL,
    "videoUrl" text NOT NULL,
    "taggedUsers" json NOT NULL,
    "latitude" double precision NOT NULL,
    "longitude" double precision NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "draft_post"
    ADD CONSTRAINT "draft_post_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

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
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20240826052417127', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240826052417127', "timestamp" = now();

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
