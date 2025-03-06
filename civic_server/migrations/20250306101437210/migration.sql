BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project" DROP COLUMN "completionRate";
ALTER TABLE "project" DROP COLUMN "commentBy";
ALTER TABLE "project" DROP COLUMN "repostBy";
ALTER TABLE "project" ADD COLUMN "repostedBy" json;
ALTER TABLE "project" ADD COLUMN "reviewedBy" json;
ALTER TABLE "project" ADD COLUMN "verifiedBy" json;
ALTER TABLE "project" ADD COLUMN "numberOfReposts" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "numberOfVerifies" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "numberOfLikes" bigint DEFAULT 0;
ALTER TABLE "project" ALTER COLUMN "numberOfReviews" SET DEFAULT 0;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250306101437210', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250306101437210', "timestamp" = now();

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
