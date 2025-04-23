BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_review_reaction" DROP CONSTRAINT "project_review_reaction_fk_1";
ALTER TABLE ONLY "project_review_reaction"
    ADD CONSTRAINT "project_review_reaction_fk_1"
    FOREIGN KEY("reviewId")
    REFERENCES "project_review"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250416094653192', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250416094653192', "timestamp" = now();

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
