BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" ADD COLUMN "likesCount" bigint DEFAULT 0;
ALTER TABLE "post" ADD COLUMN "bookmarksCount" bigint DEFAULT 0;
CREATE INDEX "post_idx" ON "post" USING btree ("ownerId", "postType", "pollId", "articleId", "projectId", "parentId", "quotedOrRepostedFromUserId");
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project" ADD COLUMN "likesCount" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "reviewsCount" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "bookmarksCount" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "vettingsCount" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "quotedBy" json;
CREATE INDEX "project_idx" ON "project" USING btree ("ownerId", "title");
--
-- ACTION ALTER TABLE
--
ALTER TABLE "user_record" ADD COLUMN "followersCount" bigint DEFAULT 0;
ALTER TABLE "user_record" ADD COLUMN "followingCount" bigint DEFAULT 0;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250729201052260', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250729201052260', "timestamp" = now();

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
