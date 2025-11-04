BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "notification" DROP CONSTRAINT "notification_fk_2";
ALTER TABLE "notification" DROP CONSTRAINT "notification_fk_3";
ALTER TABLE "notification" DROP COLUMN "postId";
ALTER TABLE "notification" DROP COLUMN "projectId";
ALTER TABLE "notification" ADD COLUMN "post" json;
ALTER TABLE "notification" ADD COLUMN "project" json;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251103215351788', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251103215351788', "timestamp" = now();

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
