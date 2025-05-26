BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" DROP COLUMN "commentBy";
ALTER TABLE "post" DROP COLUMN "repostBy";
ALTER TABLE "post" ADD COLUMN "commentedBy" json;
ALTER TABLE "post" ADD COLUMN "repostedBy" json;
ALTER TABLE "post" ADD COLUMN "bookmarkedBy" json;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250518132516470', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250518132516470', "timestamp" = now();

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
