BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "app_notification" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "app_notification" (
    "id" bigserial PRIMARY KEY,
    "receiverId" bigint NOT NULL,
    "senderId" bigint NOT NULL,
    "senderName" text,
    "groupedSenderNames" json,
    "title" text NOT NULL,
    "body" text,
    "groupKey" text,
    "actionType" text NOT NULL,
    "senderAvatarUrl" text,
    "targetType" text NOT NULL,
    "actionRoute" text NOT NULL,
    "targetId" bigint NOT NULL,
    "isRead" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "postId" bigint,
    "projectId" bigint
);

-- Indexes
CREATE INDEX "notification_receiver_isread_idx" ON "app_notification" USING btree ("receiverId", "isRead");
CREATE INDEX "notification_receiver_createdat_idx" ON "app_notification" USING btree ("receiverId", "createdAt");

--
-- ACTION DROP TABLE
--
DROP TABLE "media_asset" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "media_asset" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "postId" bigint,
    "objectKey" text NOT NULL,
    "publicUrl" text,
    "contentType" text,
    "size" bigint,
    "width" bigint,
    "height" bigint,
    "durationMs" bigint,
    "kind" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "media_post_idx" ON "media_asset" USING btree ("postId", "createdAt");
CREATE INDEX "media_owner_idx" ON "media_asset" USING btree ("ownerId", "createdAt");
CREATE UNIQUE INDEX "post_object_key_unique" ON "media_asset" USING btree ("postId", "objectKey");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" DROP COLUMN "postType";
ALTER TABLE "post" ADD COLUMN "postType" text;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "user_record" DROP COLUMN "politicalStatus";
ALTER TABLE "user_record" ADD COLUMN "politicalStatus" text;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "serverpod_session_log" ADD COLUMN "userId" text;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "app_notification"
    ADD CONSTRAINT "app_notification_fk_0"
    FOREIGN KEY("receiverId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "app_notification"
    ADD CONSTRAINT "app_notification_fk_1"
    FOREIGN KEY("senderId")
    REFERENCES "user_record"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "app_notification"
    ADD CONSTRAINT "app_notification_fk_2"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "app_notification"
    ADD CONSTRAINT "app_notification_fk_3"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "media_asset"
    ADD CONSTRAINT "media_asset_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "media_asset"
    ADD CONSTRAINT "media_asset_fk_1"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251230230044085', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251230230044085', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20250825102351908-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825102351908-v3-0-0', "timestamp" = now();


COMMIT;
