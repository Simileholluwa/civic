BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "article" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "title" text,
    "content" text,
    "banner" text,
    "dateCreated" timestamp without time zone,
    "updatedAt" timestamp without time zone,
    "numberOfComments" bigint,
    "numberOfLikes" bigint,
    "numberOfViews" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "hashtag" (
    "id" bigserial PRIMARY KEY,
    "tag" text NOT NULL,
    "usageCount" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "poll" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "question" text,
    "taggedUsers" json,
    "locations" json,
    "mentions" json,
    "options" json,
    "tags" json,
    "createdAt" timestamp without time zone,
    "pollDuration" bigint,
    "voteCount" bigint,
    "numberOfLikes" bigint,
    "numberOfComments" bigint,
    "numberOfViews" bigint,
    "imagesUrl" json,
    "updatedAt" timestamp without time zone
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "poll_vote" (
    "id" bigserial PRIMARY KEY,
    "pollId" bigint NOT NULL,
    "voterId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "poll_vote_unique_idx" ON "poll_vote" USING btree ("pollId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "pollhashtag" (
    "id" bigserial PRIMARY KEY,
    "tag" text NOT NULL,
    "usageCount" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "pollshashtags" (
    "id" bigserial PRIMARY KEY,
    "pollId" bigint NOT NULL,
    "hashtagId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "pollhashtags_index_idx" ON "pollshashtags" USING btree ("pollId", "hashtagId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "postType" bigint,
    "text" text,
    "imageUrls" json,
    "videoUrl" text,
    "taggedUsers" json,
    "locations" json,
    "mentions" json,
    "tags" json,
    "dateCreated" timestamp without time zone,
    "updatedAt" timestamp without time zone,
    "likedBy" json,
    "commentBy" json,
    "repostBy" json,
    "projectId" bigint,
    "isProjectRepost" boolean
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_comment" (
    "id" bigserial PRIMARY KEY,
    "postId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "text" text,
    "dateCreated" timestamp without time zone,
    "dateUpdated" timestamp without time zone,
    "imageUrls" json,
    "videoUrl" text,
    "likedBy" json,
    "replyBy" json,
    "parentId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_comment_likes" (
    "id" bigserial PRIMARY KEY,
    "postCommentId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "dateCreated" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "post_comment_id_unique_idx" ON "post_comment_likes" USING btree ("postCommentId", "ownerId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "post_likes" (
    "id" bigserial PRIMARY KEY,
    "postId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "dateCreated" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "post_id_unique_idx" ON "post_likes" USING btree ("postId", "ownerId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "posthashtags" (
    "id" bigserial PRIMARY KEY,
    "postId" bigint NOT NULL,
    "hashtagId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "posthashtags_index_idx" ON "posthashtags" USING btree ("postId", "hashtagId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "project" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "title" text,
    "description" text,
    "projectCategory" text,
    "projectSubCategory" text,
    "status" text,
    "startDate" timestamp without time zone,
    "endDate" timestamp without time zone,
    "currency" text,
    "fundingCategory" text,
    "fundingSubCategory" text,
    "projectCost" double precision,
    "zeroCost" boolean,
    "fundingNote" text,
    "projectImageAttachments" json,
    "projectPDFAttachments" json,
    "physicalLocations" json,
    "virtualLocations" json,
    "manualLocations" json,
    "projectVideoUrl" text,
    "dateCreated" timestamp without time zone,
    "updatedAt" timestamp without time zone,
    "likedBy" json,
    "repostedBy" json,
    "reviewedBy" json,
    "verifiedBy" json,
    "bookmarkedBy" json,
    "overallRating" double precision,
    "overallLocationRating" double precision,
    "overallDescriptionRating" double precision,
    "overallDatesRating" double precision,
    "overallAttachmentsRating" double precision,
    "overAllCategoryRating" double precision,
    "overallFundingRating" double precision
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_bookmarks" (
    "id" bigserial PRIMARY KEY,
    "projectId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "dateCreated" timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "project_bookmarks_id_unique_idx" ON "project_bookmarks" USING btree ("projectId", "ownerId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_likes" (
    "id" bigserial PRIMARY KEY,
    "projectId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "project_id_unique_idx" ON "project_likes" USING btree ("projectId", "ownerId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_reposts" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "projectId" bigint NOT NULL,
    "postId" bigint NOT NULL,
    "repostedAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE UNIQUE INDEX "project_reposts_id_unique_idx" ON "project_reposts" USING btree ("ownerId", "projectId", "postId");

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
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "likedBy" json,
    "dislikedBy" json,
    "numberOfReviews" bigint DEFAULT 0
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_review_reaction" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "reviewId" bigint NOT NULL,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "isLike" boolean,
    "isDeleted" boolean
);

-- Indexes
CREATE UNIQUE INDEX "review_id_unique_idx" ON "project_review_reaction" USING btree ("reviewId", "ownerId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "project_vetting" (
    "id" bigserial PRIMARY KEY,
    "projectId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "images" json NOT NULL,
    "text" text
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_nin_record" (
    "id" bigserial PRIMARY KEY,
    "firstName" text,
    "surname" text,
    "telephone" text,
    "photoUrl" text,
    "birthdate" text,
    "email" text,
    "gender" text,
    "ninNumber" text,
    "residenceStatus" text,
    "resisdenceAddressLine1" text,
    "residenceTown" text,
    "residenceState" text,
    "residenceLga" text,
    "ownerId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "owner_id_unique_idx" ON "user_nin_record" USING btree ("ownerId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "user_record" (
    "id" bigserial PRIMARY KEY,
    "bio" text NOT NULL,
    "nin" text,
    "phoneNumber" text,
    "userInfoId" bigint NOT NULL,
    "verifiedAccount" boolean NOT NULL,
    "following" json NOT NULL,
    "followers" json NOT NULL,
    "politicalStatus" bigint NOT NULL,
    "credibilityScore" double precision
);

-- Indexes
CREATE UNIQUE INDEX "user_info_id_unique_idx" ON "user_record" USING btree ("userInfoId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_auth_key" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "hash" text NOT NULL,
    "scopeNames" json NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_auth_key_userId_idx" ON "serverpod_auth_key" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_auth" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_email" ON "serverpod_email_auth" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_create_request" (
    "id" bigserial PRIMARY KEY,
    "userName" text NOT NULL,
    "email" text NOT NULL,
    "hash" text NOT NULL,
    "verificationCode" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_auth_create_account_request_idx" ON "serverpod_email_create_request" USING btree ("email");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_failed_sign_in" (
    "id" bigserial PRIMARY KEY,
    "email" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "ipAddress" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_email_failed_sign_in_email_idx" ON "serverpod_email_failed_sign_in" USING btree ("email");
CREATE INDEX "serverpod_email_failed_sign_in_time_idx" ON "serverpod_email_failed_sign_in" USING btree ("time");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_email_reset" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "verificationCode" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_email_reset_verification_idx" ON "serverpod_email_reset" USING btree ("verificationCode");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_google_refresh_token" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "refreshToken" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_google_refresh_token_userId_idx" ON "serverpod_google_refresh_token" USING btree ("userId");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_user_image" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "version" bigint NOT NULL,
    "url" text NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_user_image_user_id" ON "serverpod_user_image" USING btree ("userId", "version");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "serverpod_user_info" (
    "id" bigserial PRIMARY KEY,
    "userIdentifier" text NOT NULL,
    "userName" text,
    "fullName" text,
    "email" text,
    "created" timestamp without time zone NOT NULL,
    "imageUrl" text,
    "scopeNames" json NOT NULL,
    "blocked" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_user_info_user_identifier" ON "serverpod_user_info" USING btree ("userIdentifier");
CREATE INDEX "serverpod_user_info_email" ON "serverpod_user_info" USING btree ("email");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "article"
    ADD CONSTRAINT "article_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "poll"
    ADD CONSTRAINT "poll_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "poll_vote"
    ADD CONSTRAINT "poll_vote_fk_0"
    FOREIGN KEY("pollId")
    REFERENCES "poll"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "pollshashtags"
    ADD CONSTRAINT "pollshashtags_fk_0"
    FOREIGN KEY("pollId")
    REFERENCES "poll"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "pollshashtags"
    ADD CONSTRAINT "pollshashtags_fk_1"
    FOREIGN KEY("hashtagId")
    REFERENCES "pollhashtag"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post"
    ADD CONSTRAINT "post_fk_1"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_comment"
    ADD CONSTRAINT "post_comment_fk_0"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_comment"
    ADD CONSTRAINT "post_comment_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_comment"
    ADD CONSTRAINT "post_comment_fk_2"
    FOREIGN KEY("parentId")
    REFERENCES "post_comment"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_comment_likes"
    ADD CONSTRAINT "post_comment_likes_fk_0"
    FOREIGN KEY("postCommentId")
    REFERENCES "post_comment"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_comment_likes"
    ADD CONSTRAINT "post_comment_likes_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "post_likes"
    ADD CONSTRAINT "post_likes_fk_0"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_likes"
    ADD CONSTRAINT "post_likes_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "posthashtags"
    ADD CONSTRAINT "posthashtags_fk_0"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "posthashtags"
    ADD CONSTRAINT "posthashtags_fk_1"
    FOREIGN KEY("hashtagId")
    REFERENCES "hashtag"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project"
    ADD CONSTRAINT "project_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_bookmarks"
    ADD CONSTRAINT "project_bookmarks_fk_0"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_bookmarks"
    ADD CONSTRAINT "project_bookmarks_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_reposts"
    ADD CONSTRAINT "project_reposts_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_reposts"
    ADD CONSTRAINT "project_reposts_fk_1"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_reposts"
    ADD CONSTRAINT "project_reposts_fk_2"
    FOREIGN KEY("postId")
    REFERENCES "post"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "project_vetting"
    ADD CONSTRAINT "project_vetting_fk_0"
    FOREIGN KEY("projectId")
    REFERENCES "project"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "project_vetting"
    ADD CONSTRAINT "project_vetting_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_nin_record"
    ADD CONSTRAINT "user_nin_record_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "user_record"
    ADD CONSTRAINT "user_record_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250320170414078', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250320170414078', "timestamp" = now();

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
