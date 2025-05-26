BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_likes" DROP CONSTRAINT "project_likes_fk_0";
ALTER TABLE ONLY "project_likes"
    ADD CONSTRAINT "project_likes_fk_0"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_not_interested" DROP CONSTRAINT "project_not_interested_fk_1";
ALTER TABLE ONLY "project_not_interested"
    ADD CONSTRAINT "project_not_interested_fk_1"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
--
-- ACTION ALTER TABLE
--
ALTER TABLE "project_reposts" DROP CONSTRAINT "project_reposts_fk_1";
ALTER TABLE ONLY "project_reposts"
    ADD CONSTRAINT "project_reposts_fk_1"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250523160023426', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250523160023426', "timestamp" = now();

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
