BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" DROP COLUMN "commentedBy";
ALTER TABLE "post" DROP COLUMN "quotedBy";
ALTER TABLE "post" DROP COLUMN "quoteCount";

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250601125418287', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250601125418287', "timestamp" = now();

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
