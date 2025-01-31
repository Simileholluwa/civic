BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post_comment" ADD COLUMN "parentId" bigint;
ALTER TABLE ONLY "post_comment"
    ADD CONSTRAINT "post_comment_fk_2"
    FOREIGN KEY("parentId")
    REFERENCES "post_comment"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250118142418468', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250118142418468', "timestamp" = now();

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
