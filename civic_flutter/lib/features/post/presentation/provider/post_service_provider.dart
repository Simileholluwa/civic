// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_service_provider.g.dart';

@riverpod
PostLocalDatabaseImpl postLocalDatabase(PostLocalDatabaseRef ref) {
  return PostLocalDatabaseImpl(
    prefs: ref.read(localStorageProvider),
  );
}

@riverpod
PostRemoteDatabaseImpl postRemoteDatabase(PostRemoteDatabaseRef ref) {
  return PostRemoteDatabaseImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
PostRepositoryImpl postRepositoryImpl(PostRepositoryImplRef ref) {
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
SavePostUseCase savePost(SavePostRef ref) {
  return SavePostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
GetPostsUseCase getPosts(GetPostsRef ref) {
  return GetPostsUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
GetPostUseCase getPost(GetPostRef ref) {
  return GetPostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
SaveDraftUseCase saveDraft(SaveDraftRef ref) {
  return SaveDraftUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
GetDraftsUseCase getDraft(GetDraftRef ref) {
  return GetDraftsUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
DeleteDraftsUseCase deleteDrafts(DeleteDraftsRef ref) {
  return DeleteDraftsUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
DeleteDraftUseCase deleteDraft(DeleteDraftRef ref) {
  return DeleteDraftUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}


@riverpod
SchedulePostUseCase schedulePost(SchedulePostRef ref) {
  return SchedulePostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}
