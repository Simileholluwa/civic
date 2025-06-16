BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "pollshashtags" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "pollhashtag" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "poll_not_interested" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "poll_likes" CASCADE;

--
-- ACTION DROP TABLE
--
DROP TABLE "poll_bookmarks" CASCADE;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "poll" DROP CONSTRAINT "poll_fk_0";
ALTER TABLE "poll" DROP COLUMN "question";
ALTER TABLE "poll" DROP COLUMN "taggedUsers";
ALTER TABLE "poll" DROP COLUMN "locations";
ALTER TABLE "poll" DROP COLUMN "mentions";
ALTER TABLE "poll" DROP COLUMN "options";
ALTER TABLE "poll" DROP COLUMN "tags";
ALTER TABLE "poll" DROP COLUMN "createdAt";
ALTER TABLE "poll" DROP COLUMN "numberOfLikes";
ALTER TABLE "poll" DROP COLUMN "numberOfComments";
ALTER TABLE "poll" DROP COLUMN "numberOfViews";
ALTER TABLE "poll" DROP COLUMN "imagesUrl";
ALTER TABLE "poll" DROP COLUMN "updatedAt";
ALTER TABLE "poll" DROP COLUMN "commentCount";
ALTER TABLE "poll" DROP COLUMN "quoteCount";
ALTER TABLE "poll" DROP COLUMN "likedBy";
ALTER TABLE "poll" DROP COLUMN "bookmarkedBy";
ALTER TABLE "poll" ADD COLUMN "postId" bigint;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "poll_option" ADD COLUMN "_pollOptionsPollId" bigint;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" DROP CONSTRAINT "post_fk_1";
ALTER TABLE "post" DROP CONSTRAINT "post_fk_2";
ALTER TABLE "post" DROP CONSTRAINT "post_fk_3";
ALTER TABLE "post" ADD COLUMN "pollId" bigint;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "poll"
    ADD CONSTRAINT "poll_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "poll"
    ADD CONSTRAINT "poll_fk_0"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "poll_option"
    ADD CONSTRAINT "poll_option_fk_1"
    FOREIGN KEY("_pollOptionsPollId")
    REFERENCES "poll"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_4"
    FOREIGN KEY("quotedOrRepostedFromUserId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_1"
    FOREIGN KEY("pollId")
    REFERENCES "poll"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_2"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_3"
    FOREIGN KEY("parentId")
    REFERENCES "post"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250613194026020', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250613194026020', "timestamp" = now();

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
