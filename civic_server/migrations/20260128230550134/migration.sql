BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "media_asset" ADD COLUMN "projectId" bigint;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project" DROP COLUMN "projectImageAttachments";
ALTER TABLE "project" ADD COLUMN "impressionsCount" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "lastImpressionAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE "project" ALTER COLUMN "fundingCategory" SET DEFAULT ''::text;
ALTER TABLE "project" ALTER COLUMN "fundingSubCategory" SET DEFAULT ''::text;
ALTER TABLE "project" ALTER COLUMN "projectCost" SET DEFAULT 0.0;
ALTER TABLE "project" ALTER COLUMN "fundingNote" SET DEFAULT ''::text;
ALTER TABLE "project" ALTER COLUMN "overallRating" SET DEFAULT 0.0;
ALTER TABLE "project" ALTER COLUMN "overallLocationRating" SET DEFAULT 0.0;
ALTER TABLE "project" ALTER COLUMN "overallDescriptionRating" SET DEFAULT 0.0;
ALTER TABLE "project" ALTER COLUMN "overallDatesRating" SET DEFAULT 0.0;
ALTER TABLE "project" ALTER COLUMN "overallAttachmentsRating" SET DEFAULT 0.0;
ALTER TABLE "project" ALTER COLUMN "overAllCategoryRating" SET DEFAULT 0.0;
ALTER TABLE "project" ALTER COLUMN "overallFundingRating" SET DEFAULT 0.0;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "media_asset"
    ADD CONSTRAINT "media_asset_fk_2"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20260128230550134', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260128230550134', "timestamp" = now();

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
