BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "notification" (
    "id" bigserial PRIMARY KEY,
    "receiverId" bigint NOT NULL,
    "senderId" bigint,
    "type" bigint NOT NULL,
    "title" text NOT NULL,
    "body" text NOT NULL,
    "postId" bigint,
    "projectId" bigint,
    "pollId" bigint,
    "articleId" bigint,
    "actionRoute" text,
    "groupKey" text,
    "groupCount" bigint DEFAULT 1,
    "latestSenderName" text,
    "isRead" boolean DEFAULT false,
    "isSeen" boolean DEFAULT false,
    "deliveryStatus" bigint NOT NULL DEFAULT 0,
    "createdAt" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastUpdatedAt" timestamp without time zone
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
ALTER TABLE ONLY "notification"
    ADD CONSTRAINT "notification_fk_2"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "notification"
    ADD CONSTRAINT "notification_fk_3"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "notification"
    ADD CONSTRAINT "notification_fk_4"
    FOREIGN KEY("pollId")
    REFERENCES "poll"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "notification"
    ADD CONSTRAINT "notification_fk_5"
    FOREIGN KEY("articleId")
    REFERENCES "article"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250621195400891', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250621195400891', "timestamp" = now();

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
