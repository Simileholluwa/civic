BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "engagement_event" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "postId" bigint NOT NULL,
    "type" text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "engagement_event_user_post_type_idx" ON "engagement_event" USING btree ("userId", "postId", "type");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "impression_log" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "postIds" json NOT NULL,
    "page" bigint NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX "impression_log_user_created_idx" ON "impression_log" USING btree ("userId", "createdAt");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "engagement_event"
    ADD CONSTRAINT "engagement_event_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "engagement_event"
    ADD CONSTRAINT "engagement_event_fk_1"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "impression_log"
    ADD CONSTRAINT "impression_log_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251110181532797', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251110181532797', "timestamp" = now();

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
