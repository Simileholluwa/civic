BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_not_interested" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "projectId" bigint NOT NULL,
    "dateMarked" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "project_not_interested_id_unique_idx" ON "project_not_interested" USING btree ("userId", "projectId");

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_vetting" DROP COLUMN "text";
ALTER TABLE "project_vetting" ADD COLUMN "comment" text;
ALTER TABLE "project_vetting" ADD COLUMN "status" text;
ALTER TABLE "project_vetting" ADD COLUMN "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_not_interested"
    ADD CONSTRAINT "project_not_interested_fk_0"
    FOREIGN KEY("userId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_not_interested"
    ADD CONSTRAINT "project_not_interested_fk_1"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250413114724431', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250413114724431', "timestamp" = now();

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
