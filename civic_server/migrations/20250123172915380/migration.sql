BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "post_comment" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_comment" (
    "id" bigserial PRIMARY KEY,
    "postId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "text" text,
    "dateCreated" timestamp without time zone,
    "dateUpdated" timestamp without time zone,
    "imageUrls" json,
    "videoUrl" text,
    "likedBy" json,
    "replyBy" json,
    "parentId" bigint NOT NULL,
    "replies" json
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_comment"
    ADD CONSTRAINT "post_comment_fk_0"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_comment"
    ADD CONSTRAINT "post_comment_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_comment"
    ADD CONSTRAINT "post_comment_fk_2"
    FOREIGN KEY("parentId")
    REFERENCES "post_comment"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250123172915380', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250123172915380', "timestamp" = now();

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
