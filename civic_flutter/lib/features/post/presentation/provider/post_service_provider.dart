// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'post_service_provider.g.dart';

@riverpod
PostLocalDatabaseImpl postLocalDatabase(Ref ref) {
  return PostLocalDatabaseImpl(
    prefs: ref.read(localStorageProvider),
  );
}

@riverpod
PostRemoteDatabaseImpl postRemoteDatabase(Ref ref) {
  return PostRemoteDatabaseImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
PostRepositoryImpl postRepositoryImpl(Ref ref) {
  return PostRepositoryImpl(
    remoteDatabase: ref.read(
      postRemoteDatabaseProvider,
    ),
    localDatabase: ref.read(
      postLocalDatabaseProvider,
    ),
  );
}

@riverpod
SavePostUseCase savePost(Ref ref) {
  return SavePostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
GetPostsUseCase getPosts(Ref ref) {
  return GetPostsUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
GetPostUseCase getPost(Ref ref) {
  return GetPostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
SavePostDraftUseCase savePostDraft(Ref ref) {
  return SavePostDraftUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
GetPostDraftUseCase getPostDraft(Ref ref) {
  return GetPostDraftUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
DeletePostDraftUseCase deletePostDraft(Ref ref) {
  return DeletePostDraftUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
DeletePostUseCase deletePost(Ref ref) {
  return DeletePostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
SchedulePostUseCase schedulePost(Ref ref) {
  return SchedulePostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
TogglePostLikeUseCase togglePostLike(Ref ref) {
  return TogglePostLikeUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
RepostOrQuoteUseCase repostOrQuotePost(Ref ref) {
  return RepostOrQuoteUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
TogglePostBookmarkUseCase togglePostBookmark(Ref ref) {
  return TogglePostBookmarkUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
MarkPostNotInterestedUseCase markPostNotInterested(Ref ref) {
  return MarkPostNotInterestedUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
SavePostCommentUseCase savePostComment(Ref ref) {
  return SavePostCommentUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
GetPostCommentsUseCase getPostComments(Ref ref) {
  return GetPostCommentsUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
GetCommentUseCase getComment(Ref ref) {
  return GetCommentUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
GetPostCommentRepliesUseCase getPostCommentReplies(Ref ref) {
  return GetPostCommentRepliesUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}
