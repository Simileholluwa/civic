BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "article" DROP COLUMN "title";
ALTER TABLE "article" DROP COLUMN "banner";
ALTER TABLE "article" DROP COLUMN "dateCreated";
ALTER TABLE "article" DROP COLUMN "updatedAt";
ALTER TABLE "article" DROP COLUMN "numberOfComments";
ALTER TABLE "article" DROP COLUMN "numberOfLikes";
ALTER TABLE "article" DROP COLUMN "numberOfViews";
ALTER TABLE "article" ADD COLUMN "tag" json;
ALTER TABLE "article" ALTER COLUMN "content" SET DEFAULT ''::text;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" DROP CONSTRAINT "post_fk_2";
ALTER TABLE "post" DROP CONSTRAINT "post_fk_3";
ALTER TABLE "post" DROP CONSTRAINT "post_fk_4";
ALTER TABLE "post" ADD COLUMN "articleId" bigint;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_5"
    FOREIGN KEY("quotedOrRepostedFromUserId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_2"
    FOREIGN KEY("articleId")
    REFERENCES "article"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_3"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_4"
    FOREIGN KEY("parentId")
    REFERENCES "post"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250619104731110', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250619104731110', "timestamp" = now();

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
