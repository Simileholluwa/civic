// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'feed_service_provider.g.dart';

@riverpod
FeedLocalDatabaseImpl feedLocalDatabase(Ref ref) {
  return FeedLocalDatabaseImpl(
    prefs: ref.read(localStorageProvider),
  );
}

@riverpod
FeedRemoteDatabaseImpl feedRemoteDatabase(Ref ref) {
  return FeedRemoteDatabaseImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
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

@riverpod
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

@riverpod
SavePostDraftUseCase savePostDraft(Ref ref) {
  return SavePostDraftUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
GetPostDraftUseCase getPostDraft(Ref ref) {
  return GetPostDraftUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
DeletePostDraftUseCase deletePostDraft(Ref ref) {
  return DeletePostDraftUseCase(
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
GetPollsUseCase getPolls(Ref ref) {
  return GetPollsUseCase(
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
GetArticlesUseCase getArticles(Ref ref) {
  return GetArticlesUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}

@riverpod
SaveArticleUseCase saveArticle(Ref ref) {
  return SaveArticleUseCase(
    feedRepository: ref.read(feedRepositoryImplProvider),
  );
}