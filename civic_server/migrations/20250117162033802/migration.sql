BEGIN;

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
    "replyBy" json
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_comment_likes" (
    "id" bigserial PRIMARY KEY,
    "postCommentId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "dateCreated" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "post_comment_id_unique_idx" ON "post_comment_likes" USING btree ("postCommentId", "ownerId");

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

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_comment_likes"
    ADD CONSTRAINT "post_comment_likes_fk_0"
    FOREIGN KEY("postCommentId")
    REFERENCES "post_comment"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_comment_likes"
    ADD CONSTRAINT "post_comment_likes_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250117162033802', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250117162033802', "timestamp" = now();

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
