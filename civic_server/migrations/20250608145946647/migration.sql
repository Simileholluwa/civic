BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "poll_bookmarks" (
    "id" bigserial PRIMARY KEY,
    "pollId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "dateCreated" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "poll_bookmarks_id_unique_idx" ON "poll_bookmarks" USING btree ("pollId", "ownerId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "poll_likes" (
    "id" bigserial PRIMARY KEY,
    "pollId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "dateCreated" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "poll_id_unique_idx" ON "poll_likes" USING btree ("pollId", "ownerId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "poll_not_interested" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "pollId" bigint NOT NULL,
    "dateMarked" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "reason" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "poll_not_interested_id_unique_idx" ON "poll_not_interested" USING btree ("userId", "pollId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "poll_bookmarks"
    ADD CONSTRAINT "poll_bookmarks_fk_0"
    FOREIGN KEY("pollId")
    REFERENCES "poll"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "poll_bookmarks"
    ADD CONSTRAINT "poll_bookmarks_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "poll_likes"
    ADD CONSTRAINT "poll_likes_fk_0"
    FOREIGN KEY("pollId")
    REFERENCES "poll"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "poll_likes"
    ADD CONSTRAINT "poll_likes_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "poll_not_interested"
    ADD CONSTRAINT "poll_not_interested_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "poll_not_interested"
    ADD CONSTRAINT "poll_not_interested_fk_1"
    FOREIGN KEY("pollId")
    REFERENCES "poll"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250608145946647', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250608145946647', "timestamp" = now();

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
