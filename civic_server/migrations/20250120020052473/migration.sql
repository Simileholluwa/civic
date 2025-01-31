BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post_comment" DROP CONSTRAINT "post_comment_fk_2";
ALTER TABLE "post_comment" DROP COLUMN "parentId";
ALTER TABLE "post_comment" ADD COLUMN "_postCommentChildrenPostCommentId" bigint;
ALTER TABLE ONLY "post_comment"
    ADD CONSTRAINT "post_comment_fk_2"
    FOREIGN KEY("_postCommentChildrenPostCommentId")
    REFERENCES "post_comment"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250120020052473', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250120020052473', "timestamp" = now();

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
