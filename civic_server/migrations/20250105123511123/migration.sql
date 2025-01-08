BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "poll" ADD COLUMN "voteCount" bigint;
ALTER TABLE "poll" ADD COLUMN "numberOfLikes" bigint;
ALTER TABLE "poll" ADD COLUMN "numberOfComments" bigint;
ALTER TABLE "poll" ADD COLUMN "numberOfViews" bigint;
ALTER TABLE "poll" ADD COLUMN "imagesUrl" json;
ALTER TABLE "poll" ADD COLUMN "updatedAt" timestamp without time zone;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250105123511123', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250105123511123', "timestamp" = now();

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
