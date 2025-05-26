BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_reposts" (
    "id" bigserial PRIMARY KEY,
    "postId" bigint NOT NULL,
    "parentId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "post_reposts_id_unique_idx" ON "post_reposts" USING btree ("postId", "ownerId", "parentId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_reposts"
    ADD CONSTRAINT "post_reposts_fk_0"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_reposts"
    ADD CONSTRAINT "post_reposts_fk_1"
    FOREIGN KEY("parentId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_reposts"
    ADD CONSTRAINT "post_reposts_fk_2"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250520124310790', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250520124310790', "timestamp" = now();

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
