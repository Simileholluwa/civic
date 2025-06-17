BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" DROP CONSTRAINT "post_fk_1";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_1"
    FOREIGN KEY("pollId")
    REFERENCES "poll"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250617131100150', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250617131100150', "timestamp" = now();

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
