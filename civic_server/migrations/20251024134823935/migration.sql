BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "notification" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "notification" (
    "id" bigserial PRIMARY KEY,
    "receiverId" bigint NOT NULL,
    "senderId" bigint NOT NULL,
    "senderName" text,
    "groupedSenderNames" json,
    "content" text NOT NULL,
    "groupKey" text,
    "actionType" bigint NOT NULL,
    "senderAvatarUrl" text,
    "targetType" bigint NOT NULL,
    "actionRoute" text NOT NULL,
    "targetId" bigint NOT NULL,
    "isRead" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "notification_receiver_isread_idx" ON "notification" USING btree ("receiverId", "isRead");
CREATE INDEX "notification_receiver_createdat_idx" ON "notification" USING btree ("receiverId", "createdAt");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_device" (
    "id" bigserial PRIMARY KEY,
    "userInfoId" bigint NOT NULL,
    "token" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "user_device_token_idx" ON "user_device" USING btree ("token");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_notification_settings" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "pauseAllPush" boolean NOT NULL DEFAULT false,
    "allowComments" boolean NOT NULL DEFAULT true,
    "pushComments" boolean NOT NULL DEFAULT true,
    "allowLikes" boolean NOT NULL DEFAULT true,
    "pushLikes" boolean NOT NULL DEFAULT true,
    "allowRepostsAndQuotes" boolean NOT NULL DEFAULT true,
    "pushRepostsAndQuotes" boolean NOT NULL DEFAULT true,
    "allowNewReviews" boolean NOT NULL DEFAULT true,
    "pushNewReviews" boolean NOT NULL DEFAULT true,
    "allowNewVettings" boolean NOT NULL DEFAULT true,
    "pushNewVettings" boolean NOT NULL DEFAULT true,
    "allowReactions" boolean NOT NULL DEFAULT true,
    "pushReactions" boolean NOT NULL DEFAULT true,
    "allowHelpfulReviews" boolean NOT NULL DEFAULT true,
    "pushHelpfulReviews" boolean NOT NULL DEFAULT true,
    "allowSubscribedContent" boolean NOT NULL DEFAULT true,
    "pushSubscribedContent" boolean NOT NULL DEFAULT true,
    "allowMentionsAndTags" boolean NOT NULL DEFAULT true,
    "pushMentionsAndTags" boolean NOT NULL DEFAULT true,
    "allowNewFollowers" boolean NOT NULL DEFAULT true,
    "pushNewFollowers" boolean NOT NULL DEFAULT true,
    "allowPlatformUpdates" boolean NOT NULL DEFAULT true,
    "pushPlatformUpdates" boolean NOT NULL DEFAULT true
);

-- Indexes
CREATE INDEX "notification_settings_user_idx" ON "user_notification_settings" USING btree ("userId");

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
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_device"
    ADD CONSTRAINT "user_device_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_notification_settings"
    ADD CONSTRAINT "user_notification_settings_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251024134823935', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251024134823935', "timestamp" = now();

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
