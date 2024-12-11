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
SaveDraftUseCase saveDraft(Ref ref) {
  return SaveDraftUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
GetDraftsUseCase getDraft(Ref ref) {
  return GetDraftsUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
DeleteDraftsUseCase deleteDrafts(Ref ref) {
  return DeleteDraftsUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
DeleteDraftUseCase deleteDraft(Ref ref) {
  return DeleteDraftUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}


@riverpod
SchedulePostUseCase schedulePost(Ref ref) {
  return SchedulePostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}
