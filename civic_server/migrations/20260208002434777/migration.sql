BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_review" DROP COLUMN "likedBy";
ALTER TABLE "project_review" DROP COLUMN "dislikedBy";
ALTER TABLE "project_review" ADD COLUMN "likesCount" bigint DEFAULT 0;
ALTER TABLE "project_review" ADD COLUMN "dislikesCount" bigint DEFAULT 0;
ALTER TABLE "project_review" ALTER COLUMN "review" SET DEFAULT ''::text;
ALTER TABLE "project_review" ALTER COLUMN "locationRating" SET DEFAULT 0.0;
ALTER TABLE "project_review" ALTER COLUMN "descriptionRating" SET DEFAULT 0.0;
ALTER TABLE "project_review" ALTER COLUMN "attachmentsRating" SET DEFAULT 0.0;
ALTER TABLE "project_review" ALTER COLUMN "categoryRating" SET DEFAULT 0.0;
ALTER TABLE "project_review" ALTER COLUMN "fundingRating" SET DEFAULT 0.0;
ALTER TABLE "project_review" ALTER COLUMN "datesRating" SET DEFAULT 0.0;
ALTER TABLE "project_review" ALTER COLUMN "overallRating" SET DEFAULT 0.0;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_vetting" DROP COLUMN "likedBy";
ALTER TABLE "project_vetting" DROP COLUMN "dislikedBy";
ALTER TABLE "project_vetting" ADD COLUMN "likesCount" bigint DEFAULT 0;
ALTER TABLE "project_vetting" ADD COLUMN "dislikesCount" bigint DEFAULT 0;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20260208002434777', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260208002434777', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20250825102351908-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825102351908-v3-0-0', "timestamp" = now();


COMMIT;
