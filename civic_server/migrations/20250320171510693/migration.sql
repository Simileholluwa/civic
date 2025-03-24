BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post_comment_likes" DROP CONSTRAINT "post_comment_likes_fk_0";
ALTER TABLE ONLY "post_comment_likes"
    ADD CONSTRAINT "post_comment_likes_fk_0"
    FOREIGN KEY("postCommentId")
    REFERENCES "post_comment"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250320171510693', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250320171510693', "timestamp" = now();

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
