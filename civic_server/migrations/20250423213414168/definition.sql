BEGIN;

--
-- Class Article as table article
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
-- Class Hashtag as table hashtag
--
CREATE TABLE "hashtag" (
    "id" bigserial PRIMARY KEY,
    "tag" text NOT NULL,
    "usageCount" bigint NOT NULL
);

--
-- Class Poll as table poll
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
-- Class PollVote as table poll_vote
--
CREATE TABLE "poll_vote" (
    "id" bigserial PRIMARY KEY,
    "pollId" bigint NOT NULL,
    "voterId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "poll_vote_unique_idx" ON "poll_vote" USING btree ("pollId");

--
-- Class PollHashtag as table pollhashtag
--
CREATE TABLE "pollhashtag" (
    "id" bigserial PRIMARY KEY,
    "tag" text NOT NULL,
    "usageCount" bigint NOT NULL
);

--
-- Class PollsHashtags as table pollshashtags
--
CREATE TABLE "pollshashtags" (
    "id" bigserial PRIMARY KEY,
    "pollId" bigint NOT NULL,
    "hashtagId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "pollhashtags_index_idx" ON "pollshashtags" USING btree ("pollId", "hashtagId");

--
-- Class Post as table post
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
-- Class PostComment as table post_comment
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
-- Class PostCommentLikes as table post_comment_likes
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
-- Class PostLikes as table post_likes
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
-- Class PostsHashtags as table posthashtags
--
CREATE TABLE "posthashtags" (
    "id" bigserial PRIMARY KEY,
    "postId" bigint NOT NULL,
    "hashtagId" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "posthashtags_index_idx" ON "posthashtags" USING btree ("postId", "hashtagId");

--
-- Class Project as table project
--
CREATE TABLE "project" (
    "id" bigserial PRIMARY KEY,
    "ownerId" bigint NOT NULL,
    "title" text,
    "description" text,
    "projectCategory" text,
    "projectSubCategory" text,
    "startDate" timestamp without time zone,
    "endDate" timestamp without time zone,
    "currency" text,
    "fundingCategory" text,
    "fundingSubCategory" text,
    "projectCost" double precision,
    "fundingNote" text,
    "projectImageAttachments" json,
    "projectPDFAttachments" json,
    "physicalLocations" json,
    "virtualLocations" json,
    "projectVideoUrl" text,
    "dateCreated" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone,
    "likedBy" json,
    "repostedBy" json,
    "reviewedBy" json,
    "verifiedBy" json,
    "bookmarkedBy" json,
    "vettedBy" json,
    "overallRating" double precision,
    "overallLocationRating" double precision,
    "overallDescriptionRating" double precision,
    "overallDatesRating" double precision,
    "overallAttachmentsRating" double precision,
    "overAllCategoryRating" double precision,
    "overallFundingRating" double precision,
    "isDeleted" boolean DEFAULT false
);

--
-- Class ProjectBookmarks as table project_bookmarks
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
-- Class ProjectLikes as table project_likes
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
-- Class ProjectNotInterested as table project_not_interested
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
-- Class ProjectRepost as table project_reposts
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
-- Class ProjectReview as table project_review
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
-- Class ProjectReviewReaction as table project_review_reaction
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
-- Class ProjectVetting as table project_vetting
--
CREATE TABLE "project_vetting" (
    "id" bigserial PRIMARY KEY,
    "projectId" bigint NOT NULL,
    "ownerId" bigint NOT NULL,
    "images" json,
    "comment" text,
    "status" text,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" timestamp without time zone
);

--
-- Class UserNinRecord as table user_nin_record
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
-- Class UserRecord as table user_record
--
CREATE TABLE "user_record" (
    "id" bigserial PRIMARY KEY,
    "bio" text,
    "nin" text,
    "phoneNumber" text,
    "userInfoId" bigint NOT NULL,
    "verifiedAccount" boolean,
    "following" json,
    "followers" json,
    "politicalStatus" bigint,
    "credibilityScore" double precision
);

-- Indexes
CREATE UNIQUE INDEX "user_info_id_unique_idx" ON "user_record" USING btree ("userInfoId");

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Class AuthKey as table serverpod_auth_key
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
-- Class EmailAuth as table serverpod_email_auth
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
-- Class EmailCreateAccountRequest as table serverpod_email_create_request
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
-- Class EmailFailedSignIn as table serverpod_email_failed_sign_in
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
-- Class EmailReset as table serverpod_email_reset
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
-- Class GoogleRefreshToken as table serverpod_google_refresh_token
--
CREATE TABLE "serverpod_google_refresh_token" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "refreshToken" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_google_refresh_token_userId_idx" ON "serverpod_google_refresh_token" USING btree ("userId");

--
-- Class UserImage as table serverpod_user_image
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
-- Class UserInfo as table serverpod_user_info
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
-- Foreign relations for "article" table
--
ALTER TABLE ONLY "article"
    ADD CONSTRAINT "article_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "poll" table
--
ALTER TABLE ONLY "poll"
    ADD CONSTRAINT "poll_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "poll_vote" table
--
ALTER TABLE ONLY "poll_vote"
    ADD CONSTRAINT "poll_vote_fk_0"
    FOREIGN KEY("pollId")
    REFERENCES "poll"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "pollshashtags" table
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
-- Foreign relations for "post" table
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
-- Foreign relations for "post_comment" table
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
-- Foreign relations for "post_comment_likes" table
--
ALTER TABLE ONLY "post_comment_likes"
    ADD CONSTRAINT "post_comment_likes_fk_0"
    FOREIGN KEY("postCommentId")
    REFERENCES "post_comment"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "post_comment_likes"
    ADD CONSTRAINT "post_comment_likes_fk_1"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "post_likes" table
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
-- Foreign relations for "posthashtags" table
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
-- Foreign relations for "project" table
--
ALTER TABLE ONLY "project"
    ADD CONSTRAINT "project_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "user_record"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "project_bookmarks" table
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
-- Foreign relations for "project_likes" table
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
-- Foreign relations for "project_not_interested" table
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
-- Foreign relations for "project_reposts" table
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
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "project_review" table
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
-- Foreign relations for "project_review_reaction" table
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
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "project_vetting" table
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
-- Foreign relations for "user_nin_record" table
--
ALTER TABLE ONLY "user_nin_record"
    ADD CONSTRAINT "user_nin_record_fk_0"
    FOREIGN KEY("ownerId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "user_record" table
--
ALTER TABLE ONLY "user_record"
    ADD CONSTRAINT "user_record_fk_0"
    FOREIGN KEY("userInfoId")
    REFERENCES "serverpod_user_info"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR civic
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('civic', '20250423213414168', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250423213414168', "timestamp" = now();

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
