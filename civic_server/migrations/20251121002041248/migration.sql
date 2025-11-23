BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_follow" (
    "id" bigserial PRIMARY KEY,
    "followerId" bigint NOT NULL,
    "followeeId" bigint NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "follower_followee_unique_idx" ON "user_follow" USING btree ("followerId", "followeeId");
CREATE INDEX "follower_idx" ON "user_follow" USING btree ("followerId");
CREATE INDEX "followee_idx" ON "user_follow" USING btree ("followeeId");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "user_record" DROP COLUMN "following";
ALTER TABLE "user_record" DROP COLUMN "followers";

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251121002041248', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251121002041248', "timestamp" = now();

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
