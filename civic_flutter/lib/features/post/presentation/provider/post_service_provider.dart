// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/local_storage/storage_utility.dart';
import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/features/post/data/datasources/post_local_database.dart';
import 'package:civic_flutter/features/post/data/datasources/post_remote_database.dart';
import 'package:civic_flutter/features/post/data/repositories/post_repository_impl.dart';
import 'package:civic_flutter/features/post/domain/usecases/delete_all_drafts_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/delete_draft_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/list_post_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/retrieve_drafts_post_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/retrieve_post_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_draft_post_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_post_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_service_provider.g.dart';

@riverpod
PostLocalDatabaseImpl postLocalDatabase(PostLocalDatabaseRef ref) {
  return PostLocalDatabaseImpl(
    prefs: AppLocalStorage.to,
  );
}

@riverpod
PostRemoteDatabaseImpl postRemoteDatabase(PostRemoteDatabaseRef ref) {
  return PostRemoteDatabaseImpl(
    client: ref.read(clientProvider),
    sessionManager: ref.read(sessionProvider),
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
ListPostUseCase listPost(ListPostRef ref) {
  return ListPostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
RetrievePostUseCase retrievePost(RetrievePostRef ref) {
  return RetrievePostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
SaveDraftPostUseCase saveDraftPost(SaveDraftPostRef ref) {
  return SaveDraftPostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
RetrieveDraftPostUseCase retrieveDraftPost(RetrieveDraftPostRef ref) {
  return RetrieveDraftPostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
DeleteAllDraftPostUseCase deleteAllDraftPost(DeleteAllDraftPostRef ref) {
  return DeleteAllDraftPostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}

@riverpod
DeleteDraftPostUseCase deleteDraftPost(DeleteDraftPostRef ref) {
  return DeleteDraftPostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}
