BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project" ADD COLUMN "overallRating" double precision;
ALTER TABLE "project" ADD COLUMN "numberOfReviews" bigint;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_review" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "projectId" bigint NOT NULL,
    "review" text,
    "locationRating" double precision,
    "descriptionRating" double precision,
    "attachmentsRating" double precision,
    "categoryRating" double precision,
    "fundingRating" double precision,
    "datesRating" double precision,
    "overallRating" double precision,
    "dateCreated" timestamp without time zone,
    "updatedAt" timestamp without time zone
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_review"
    ADD CONSTRAINT "project_review_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_review"
    ADD CONSTRAINT "project_review_fk_1"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250213054810660', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250213054810660', "timestamp" = now();

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
