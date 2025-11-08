BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project" DROP COLUMN "projectImageAttachments";
ALTER TABLE "project" DROP COLUMN "projectPDFAttachments";
ALTER TABLE "project" DROP COLUMN "physicalLocations";
ALTER TABLE "project" DROP COLUMN "virtualLocations";
ALTER TABLE "project" DROP COLUMN "projectVideoUrl";
ALTER TABLE "project" DROP COLUMN "likedBy";
ALTER TABLE "project" DROP COLUMN "reviewedBy";
ALTER TABLE "project" DROP COLUMN "bookmarkedBy";
ALTER TABLE "project" DROP COLUMN "vettedBy";
ALTER TABLE "project" DROP COLUMN "subscribers";
ALTER TABLE "project" DROP COLUMN "quotedBy";
ALTER TABLE "project" DROP COLUMN "quoteCount";
ALTER TABLE "project" ADD COLUMN "imagesCount" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "pdfsCount" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "attachmentsCount" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "physicalLocationsCount" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "virtualLocationsCount" bigint DEFAULT 0;
ALTER TABLE "project" ADD COLUMN "quotesCount" bigint DEFAULT 0;
--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_attachment" (
    "id" bigserial PRIMARY KEY,
    "projectId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "type" text,
    "url" text,
    "storageKey" text,
    "fileName" text,
    "mimeType" text,
    "sizeBytes" bigint,
    "width" bigint,
    "height" bigint,
    "pageCount" bigint,
    "description" text,
    "orderIndex" bigint DEFAULT 0,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "isDeleted" boolean DEFAULT false
);

-- Indexes
CREATE INDEX "project_attachment_idx" ON "project_attachment" USING btree ("projectId", "type", "dateCreated");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_physical_location" (
    "id" bigserial PRIMARY KEY,
    "projectId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "place" text,
    "latitude" double precision,
    "longitude" double precision,
    "orderIndex" bigint DEFAULT 0,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "isDeleted" boolean DEFAULT false
);

-- Indexes
CREATE INDEX "project_physical_location_project_idx" ON "project_physical_location" USING btree ("projectId", "dateCreated");
CREATE INDEX "project_physical_location_owner_idx" ON "project_physical_location" USING btree ("ownerId", "projectId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_rating" (
    "id" bigserial PRIMARY KEY,
    "projectId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "reviewId" bigint NOT NULL,
    "dimension" text,
    "value" double precision,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "isDeleted" boolean DEFAULT false
);

-- Indexes
CREATE UNIQUE INDEX "project_rating_unique" ON "project_rating" USING btree ("projectId", "ownerId", "dimension");
CREATE INDEX "project_rating_project_dim_created_idx" ON "project_rating" USING btree ("projectId", "dimension", "dateCreated");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_virtual_location" (
    "id" bigserial PRIMARY KEY,
    "projectId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "value" text,
    "orderIndex" bigint DEFAULT 0,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "isDeleted" boolean DEFAULT false
);

-- Indexes
CREATE INDEX "project_virtual_location_project_idx" ON "project_virtual_location" USING btree ("projectId", "dateCreated");
CREATE INDEX "project_virtual_location_owner_idx" ON "project_virtual_location" USING btree ("ownerId", "projectId");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_attachment"
    ADD CONSTRAINT "project_attachment_fk_0"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_attachment"
    ADD CONSTRAINT "project_attachment_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_physical_location"
    ADD CONSTRAINT "project_physical_location_fk_0"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_physical_location"
    ADD CONSTRAINT "project_physical_location_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_rating"
    ADD CONSTRAINT "project_rating_fk_0"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_rating"
    ADD CONSTRAINT "project_rating_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_rating"
    ADD CONSTRAINT "project_rating_fk_2"
    FOREIGN KEY("reviewId")
    REFERENCES "project_review"("id")
    ON DELETE SET NULL
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_virtual_location"
    ADD CONSTRAINT "project_virtual_location_fk_0"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_virtual_location"
    ADD CONSTRAINT "project_virtual_location_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20251107165212280', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251107165212280', "timestamp" = now();

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
