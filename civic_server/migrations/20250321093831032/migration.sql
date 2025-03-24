BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project" DROP COLUMN "status";
ALTER TABLE "project" DROP COLUMN "zeroCost";
ALTER TABLE "project" ALTER COLUMN "dateCreated" SET DEFAULT CURRENT_TIMESTAMP;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250321093831032', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250321093831032', "timestamp" = now();

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
