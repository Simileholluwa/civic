BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "app_notification" DROP CONSTRAINT "app_notification_fk_2";
ALTER TABLE "app_notification" DROP CONSTRAINT "app_notification_fk_3";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "app_notification"
    ADD CONSTRAINT "app_notification_fk_2"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "app_notification"
    ADD CONSTRAINT "app_notification_fk_3"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251221172552588', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251221172552588', "timestamp" = now();

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
