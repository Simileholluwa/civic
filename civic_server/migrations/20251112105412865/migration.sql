BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" DROP CONSTRAINT "post_fk_5";
ALTER TABLE "post" DROP COLUMN "likedBy";
ALTER TABLE "post" DROP COLUMN "bookmarkedBy";
ALTER TABLE "post" DROP COLUMN "subscribers";
ALTER TABLE "post" DROP COLUMN "quotedOrRepostedFromUserId";
CREATE INDEX "post_type_date_idx" ON "post" USING btree ("postType", "dateCreated");
CREATE INDEX "post_owner_date_idx" ON "post" USING btree ("ownerId", "dateCreated");
CREATE INDEX "post_parent_date_idx" ON "post" USING btree ("parentId", "dateCreated");

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251112105412865', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251112105412865', "timestamp" = now();

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
