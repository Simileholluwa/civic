BEGIN;

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
    "kind" bigint NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" timestamp without time zone
);

-- Indexes
CREATE INDEX "media_post_idx" ON "media_asset" USING btree ("postId", "createdAt");
CREATE INDEX "media_owner_idx" ON "media_asset" USING btree ("ownerId", "createdAt");

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
    VALUES ('civic', '20251226131233505', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251226131233505', "timestamp" = now();

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
