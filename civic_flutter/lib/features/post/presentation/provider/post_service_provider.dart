// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/core/providers/local_storage_provider.dart';
import 'package:civic_flutter/features/post/data/datasources/post_local_database.dart';
import 'package:civic_flutter/features/post/data/datasources/post_remote_database.dart';
import 'package:civic_flutter/features/post/data/repositories/post_repository_impl.dart';
import 'package:civic_flutter/features/post/domain/usecases/delete_drafts_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/delete_draft_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/get_drafts_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/get_post_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/get_posts_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_draft_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/schedule_post_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_post_use_case.dart';
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
