BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user_notification_settings" DROP CONSTRAINT "user_notification_settings_fk_0";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_notification_settings"
    ADD CONSTRAINT "user_notification_settings_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251024195727492', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251024195727492', "timestamp" = now();

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
