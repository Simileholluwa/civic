BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "post_not_interested" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_not_interested" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "postId" bigint NOT NULL,
    "dateMarked" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "reason" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "post_not_interested_id_unique_idx" ON "post_not_interested" USING btree ("userId", "postId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_not_interested"
    ADD CONSTRAINT "post_not_interested_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_not_interested"
    ADD CONSTRAINT "post_not_interested_fk_1"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250531115825532', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250531115825532', "timestamp" = now();

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
