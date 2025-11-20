BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "post" ADD COLUMN "impressionsCount" bigint DEFAULT 0;
ALTER TABLE "post" ADD COLUMN "lastImpressionAt" timestamp without time zone;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_impression" (
    "id" bigserial PRIMARY KEY,
    "postId" bigint NOT NULL,
    "viewerId" bigint NOT NULL,
    "sessionId" text,
    "source" text,
    "hourBucket" timestamp without time zone,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "post_impression_unique_idx" ON "post_impression" USING btree ("postId", "hourBucket", "viewerId", "sessionId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_impression"
    ADD CONSTRAINT "post_impression_fk_0"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_impression"
    ADD CONSTRAINT "post_impression_fk_1"
    FOREIGN KEY("viewerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251119180308459', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251119180308459', "timestamp" = now();

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
