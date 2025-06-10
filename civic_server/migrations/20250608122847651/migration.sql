BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "poll" ADD COLUMN "commentCount" bigint DEFAULT 0;
ALTER TABLE "poll" ADD COLUMN "quoteCount" bigint DEFAULT 0;
ALTER TABLE "poll" ADD COLUMN "likedBy" json;
ALTER TABLE "poll" ADD COLUMN "bookmarkedBy" json;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250608122847651', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250608122847651', "timestamp" = now();

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
