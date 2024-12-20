BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project" ADD COLUMN "updatedAt" timestamp without time zone;
ALTER TABLE "project" ADD COLUMN "likesCount" bigint;
ALTER TABLE "project" ADD COLUMN "commentsCount" bigint;
ALTER TABLE "project" ADD COLUMN "repostCount" bigint;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_likes" (
    "id" bigserial PRIMARY KEY,
    "projectId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "dateCreated" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "project_id_unique_idx" ON "project_likes" USING btree ("projectId", "ownerId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_likes"
    ADD CONSTRAINT "project_likes_fk_0"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_likes"
    ADD CONSTRAINT "project_likes_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20241219182620007', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20241219182620007', "timestamp" = now();

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
