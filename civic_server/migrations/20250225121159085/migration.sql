BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_review" ADD COLUMN "likes" bigint;
ALTER TABLE "project_review" ADD COLUMN "dislikes" bigint;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_review_reaction" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "reviewId" bigint NOT NULL,
    "dateCreated" timestamp without time zone,
    "updatedAt" timestamp without time zone,
    "isLike" boolean,
    "isDeleted" boolean
);

-- Indexes
CREATE UNIQUE INDEX "review_id_unique_idx" ON "project_review_reaction" USING btree ("reviewId", "ownerId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_review_reaction"
    ADD CONSTRAINT "project_review_reaction_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_review_reaction"
    ADD CONSTRAINT "project_review_reaction_fk_1"
    FOREIGN KEY("reviewId")
    REFERENCES "project_review"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250225121159085', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250225121159085', "timestamp" = now();

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
