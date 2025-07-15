BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "notification" ADD COLUMN "triggerUser" text;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" ADD COLUMN "subscribers" json;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_subscription" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "postId" bigint NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "post_notif_unique_idx" ON "post_subscription" USING btree ("userId", "postId");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project" ADD COLUMN "subscribers" json;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_subscription" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "projectId" bigint NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "project_notif_unique_idx" ON "project_subscription" USING btree ("userId", "projectId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_subscription"
    ADD CONSTRAINT "post_subscription_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_subscription"
    ADD CONSTRAINT "post_subscription_fk_1"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_subscription"
    ADD CONSTRAINT "project_subscription_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_subscription"
    ADD CONSTRAINT "project_subscription_fk_1"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250712112519645', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250712112519645', "timestamp" = now();

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
