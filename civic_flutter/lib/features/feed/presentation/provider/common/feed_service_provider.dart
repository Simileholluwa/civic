import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feed_service_provider.g.dart';

@Riverpod(keepAlive: true)
FeedLocalDatabaseImpl feedLocalDatabase(Ref ref) {
  return FeedLocalDatabaseImpl(
    prefs: ref.read(localStorageProvider),
  );
}

@Riverpod(keepAlive: true)
FeedRemoteDatabaseImpl feedRemoteDatabase(Ref ref) {
  return FeedRemoteDatabaseImpl(
    client: ref.read(clientProvider),
  );
}

@Riverpod(keepAlive: true)
FeedRepositoryImpl feedRepositoryImpl(Ref ref) {
  return FeedRepositoryImpl(
    remoteDatabase: ref.read(
      feedRemoteDatabaseProvider,
    ),
    localDatabase: ref.read(
      feedLocalDatabaseProvider,
    ),
  );
}

@riverpod
SavePostUseCase savePost(Ref ref) {
  return SavePostUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@Riverpod(keepAlive: true)
GetPostsUseCase getPosts(Ref ref) {
  return GetPostsUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
GetPostUseCase getPost(Ref ref) {
  return GetPostUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@Riverpod(keepAlive: true)
GetUserBookmarksUseCase getUserPostBookmarks(Ref ref) {
  return GetUserBookmarksUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@Riverpod(keepAlive: true)
ClearPostBookmarksUseCase clearPostBookmarks(Ref ref) {
  return ClearPostBookmarksUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
SaveOrUpdatePostDraftUseCase savePostDraft(Ref ref) {
  return SaveOrUpdatePostDraftUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
GetPostDraftsUseCase getPostDrafts(Ref ref) {
  return GetPostDraftsUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
DeletePostDraftByIdUseCase deletePostDraft(Ref ref) {
  return DeletePostDraftByIdUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
ClearPostDraftsUseCase clearPostDrafts(Ref ref) {
  return ClearPostDraftsUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
DeletePostUseCase deletePost(Ref ref) {
  return DeletePostUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
SubscribeToNotifUseCase subscribeToNotif(Ref ref) {
  return SubscribeToNotifUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
SchedulePostUseCase schedulePost(Ref ref) {
  return SchedulePostUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
TogglePostLikeUseCase togglePostLike(Ref ref) {
  return TogglePostLikeUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
QuotePostUseCase quotePost(Ref ref) {
  return QuotePostUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
ClearVoteUseCase clearVote(Ref ref) {
  return ClearVoteUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
RepostPostUseCase repostPost(Ref ref) {
  return RepostPostUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
RepostOrQuoteUseCase repostOrQuotePost(Ref ref) {
  return RepostOrQuoteUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
TogglePostBookmarkUseCase togglePostBookmark(Ref ref) {
  return TogglePostBookmarkUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
MarkPostNotInterestedUseCase markPostNotInterested(Ref ref) {
  return MarkPostNotInterestedUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
SavePostCommentUseCase savePostComment(Ref ref) {
  return SavePostCommentUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
GetPostCommentsUseCase getPostComments(Ref ref) {
  return GetPostCommentsUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
GetCommentUseCase getCommentDetail(Ref ref) {
  return GetCommentUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
GetPostCommentRepliesUseCase getPostCommentReplies(Ref ref) {
  return GetPostCommentRepliesUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
SavePollUseCase savePoll(Ref ref) {
  return SavePollUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
CastVoteUseCase castVote(Ref ref) {
  return CastVoteUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
SaveArticleUseCase saveArticle(Ref ref) {
  return SaveArticleUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
RecordPostImpressionUseCase recordPostImpression(Ref ref) {
  return RecordPostImpressionUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
FlushPostImpressionsUseCase flushPostImpressions(Ref ref) {
  return FlushPostImpressionsUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}
