BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "project_virtual_location" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "project_physical_location" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "project_attachment" CASCADE;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project" DROP COLUMN "imagesCount";
ALTER TABLE "project" DROP COLUMN "pdfsCount";
ALTER TABLE "project" DROP COLUMN "attachmentsCount";
ALTER TABLE "project" DROP COLUMN "physicalLocationsCount";
ALTER TABLE "project" DROP COLUMN "virtualLocationsCount";
ALTER TABLE "project" ADD COLUMN "projectImageAttachments" json;
ALTER TABLE "project" ADD COLUMN "projectPDFAttachments" json;
ALTER TABLE "project" ADD COLUMN "physicalLocations" json;
ALTER TABLE "project" ADD COLUMN "virtualLocations" json;
ALTER TABLE "project" ADD COLUMN "projectVideoUrl" text;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251108002700060', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251108002700060', "timestamp" = now();

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
