BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_review" DROP COLUMN "numberOfReviews";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_vetting" ADD COLUMN "likedBy" json;
ALTER TABLE "project_vetting" ADD COLUMN "dislikedBy" json;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_vetting_reaction" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "vettingId" bigint NOT NULL,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "isLike" boolean,
    "isDeleted" boolean
);

-- Indexes
CREATE UNIQUE INDEX "vetting_id_unique_idx" ON "project_vetting_reaction" USING btree ("vettingId", "ownerId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_vetting_reaction"
    ADD CONSTRAINT "project_vetting_reaction_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_vetting_reaction"
    ADD CONSTRAINT "project_vetting_reaction_fk_1"
    FOREIGN KEY("vettingId")
    REFERENCES "project_vetting"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250508121800836', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250508121800836', "timestamp" = now();

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
