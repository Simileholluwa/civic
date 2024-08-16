import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/features/post/data/datasources/post_remote_database.dart';
import 'package:civic_flutter/features/post/data/repositories/post_repository_impl.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_post_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_service_provider.g.dart';

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
  );
}

@riverpod
SavePostUseCase savePostUseCase(SavePostUseCaseRef ref) {
  return SavePostUseCase(
    postRepository: ref.read(postRepositoryImplProvider),
  );
}
