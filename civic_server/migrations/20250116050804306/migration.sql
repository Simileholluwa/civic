BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" ADD COLUMN "likedBy" json;
ALTER TABLE "post" ADD COLUMN "commentBy" json;
ALTER TABLE "post" ADD COLUMN "repostBy" json;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_likes" (
    "id" bigserial PRIMARY KEY,
    "postId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "dateCreated" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "post_id_unique_idx" ON "post_likes" USING btree ("postId", "ownerId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_likes"
    ADD CONSTRAINT "post_likes_fk_0"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_likes"
    ADD CONSTRAINT "post_likes_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250116050804306', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250116050804306', "timestamp" = now();

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
