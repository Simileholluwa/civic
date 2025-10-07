BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "article" DROP CONSTRAINT "article_fk_0";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "notification" DROP CONSTRAINT "notification_fk_0";
ALTER TABLE "notification" DROP CONSTRAINT "notification_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "poll" DROP CONSTRAINT "poll_fk_0";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" DROP CONSTRAINT "post_fk_0";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "post_bookmarks" DROP CONSTRAINT "post_bookmarks_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "post_likes" DROP CONSTRAINT "post_likes_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "post_not_interested" DROP CONSTRAINT "post_not_interested_fk_0";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_bookmarks" DROP CONSTRAINT "project_bookmarks_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_likes" DROP CONSTRAINT "project_likes_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_not_interested" DROP CONSTRAINT "project_not_interested_fk_0";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_review" DROP CONSTRAINT "project_review_fk_0";
ALTER TABLE "project_review" DROP CONSTRAINT "project_review_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_review_reaction" DROP CONSTRAINT "project_review_reaction_fk_0";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_vetting" DROP CONSTRAINT "project_vetting_fk_0";
ALTER TABLE "project_vetting" DROP CONSTRAINT "project_vetting_fk_1";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_vetting_reaction" DROP CONSTRAINT "project_vetting_reaction_fk_0";
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "article"
    ADD CONSTRAINT "article_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "notification"
    ADD CONSTRAINT "notification_fk_0"
    FOREIGN KEY("receiverId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "notification"
    ADD CONSTRAINT "notification_fk_1"
    FOREIGN KEY("senderId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "poll"
    ADD CONSTRAINT "poll_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_bookmarks"
    ADD CONSTRAINT "post_bookmarks_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_likes"
    ADD CONSTRAINT "post_likes_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_not_interested"
    ADD CONSTRAINT "post_not_interested_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_bookmarks"
    ADD CONSTRAINT "project_bookmarks_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_likes"
    ADD CONSTRAINT "project_likes_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_not_interested"
    ADD CONSTRAINT "project_not_interested_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_review"
    ADD CONSTRAINT "project_review_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_review"
    ADD CONSTRAINT "project_review_fk_1"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_review_reaction"
    ADD CONSTRAINT "project_review_reaction_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_vetting"
    ADD CONSTRAINT "project_vetting_fk_0"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_vetting"
    ADD CONSTRAINT "project_vetting_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_vetting_reaction"
    ADD CONSTRAINT "project_vetting_reaction_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251007204015214', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251007204015214', "timestamp" = now();

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
