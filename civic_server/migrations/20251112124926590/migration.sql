BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "poll" DROP COLUMN "votedBy";
ALTER TABLE "poll" ADD COLUMN "votesCount" bigint DEFAULT 0;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "poll_option" DROP COLUMN "votedBy";
ALTER TABLE "poll_option" ADD COLUMN "votesCount" bigint DEFAULT 0;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251112124926590', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251112124926590', "timestamp" = now();

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
