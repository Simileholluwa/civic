BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post_not_interested" DROP CONSTRAINT "post_not_interested_fk_1";
ALTER TABLE ONLY "post_not_interested"
    ADD CONSTRAINT "post_not_interested_fk_1"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250603205312930', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250603205312930', "timestamp" = now();

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
