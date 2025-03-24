BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user_record" ALTER COLUMN "bio" DROP NOT NULL;
ALTER TABLE "user_record" ALTER COLUMN "verifiedAccount" DROP NOT NULL;
ALTER TABLE "user_record" ALTER COLUMN "following" DROP NOT NULL;
ALTER TABLE "user_record" ALTER COLUMN "followers" DROP NOT NULL;
ALTER TABLE "user_record" ALTER COLUMN "politicalStatus" DROP NOT NULL;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250321084750682', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250321084750682', "timestamp" = now();

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
