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
    "groupedSenderIds" json,
    "groupKey" text,
    "actionType" text NOT NULL,
    "targetType" text NOT NULL,
    "actionRoute" text NOT NULL,
    "targetId" bigint NOT NULL,
    "targetOwnerId" bigint,
    "isRead" boolean NOT NULL DEFAULT false,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "notification"
    ADD CONSTRAINT "notification_fk_0"
    FOREIGN KEY("receiverId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "notification"
    ADD CONSTRAINT "notification_fk_1"
    FOREIGN KEY("senderId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250625145011791', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250625145011791', "timestamp" = now();

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
