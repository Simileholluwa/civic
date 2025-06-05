BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "poll" DROP COLUMN "pollDuration";
ALTER TABLE "poll" DROP COLUMN "voteCount";
ALTER TABLE "poll" DROP COLUMN "options";
ALTER TABLE "poll" ADD COLUMN "expiresAt" timestamp without time zone;
ALTER TABLE "poll" ADD COLUMN "votedBy" json;
ALTER TABLE "poll" ADD COLUMN "options" json;
ALTER TABLE "poll" ALTER COLUMN "createdAt" SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE "poll" ALTER COLUMN "numberOfLikes" SET DEFAULT 0;
ALTER TABLE "poll" ALTER COLUMN "numberOfComments" SET DEFAULT 0;
ALTER TABLE "poll" ALTER COLUMN "numberOfViews" SET DEFAULT 0;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "poll_option" (
    "id" bigserial PRIMARY KEY,
    "pollId" bigint NOT NULL,
    "option" text,
    "votedBy" json
);

--
-- ACTION DROP TABLE
--
DROP TABLE "poll_vote" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "poll_vote" (
    "id" bigserial PRIMARY KEY,
    "pollId" bigint NOT NULL,
    "optionId" bigint NOT NULL,
    "voterId" bigint NOT NULL,
    "votedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "poll_vote_unique_idx" ON "poll_vote" USING btree ("pollId", "voterId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "poll_option"
    ADD CONSTRAINT "poll_option_fk_0"
    FOREIGN KEY("pollId")
    REFERENCES "poll"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "poll_vote"
    ADD CONSTRAINT "poll_vote_fk_0"
    FOREIGN KEY("pollId")
    REFERENCES "poll"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "poll_vote"
    ADD CONSTRAINT "poll_vote_fk_1"
    FOREIGN KEY("optionId")
    REFERENCES "poll_option"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "poll_vote"
    ADD CONSTRAINT "poll_vote_fk_2"
    FOREIGN KEY("voterId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250604220017575', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250604220017575', "timestamp" = now();

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
