BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user_notification_settings" DROP COLUMN "allowMentionsAndTags";
ALTER TABLE "user_notification_settings" DROP COLUMN "pushMentionsAndTags";
ALTER TABLE "user_notification_settings" ADD COLUMN "allowMentions" boolean NOT NULL DEFAULT true;
ALTER TABLE "user_notification_settings" ADD COLUMN "pushMentions" boolean NOT NULL DEFAULT true;
ALTER TABLE "user_notification_settings" ADD COLUMN "allowTags" boolean NOT NULL DEFAULT true;
ALTER TABLE "user_notification_settings" ADD COLUMN "pushTags" boolean NOT NULL DEFAULT true;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251027004858018', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251027004858018', "timestamp" = now();

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
