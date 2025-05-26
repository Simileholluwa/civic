BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post_bookmarks" DROP CONSTRAINT "post_bookmarks_fk_0";
ALTER TABLE ONLY "post_bookmarks"
    ADD CONSTRAINT "post_bookmarks_fk_0"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_bookmarks" DROP CONSTRAINT "project_bookmarks_fk_0";
ALTER TABLE ONLY "project_bookmarks"
    ADD CONSTRAINT "project_bookmarks_fk_0"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250521221802801', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250521221802801', "timestamp" = now();

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
