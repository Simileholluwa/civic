// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'project_services_provider.g.dart';

@riverpod
ProjectRemoteDatasourceImpl projectRemoteDatasource(Ref ref) {
  return ProjectRemoteDatasourceImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
ProjectRepositoryImpl projectRepositoryImpl(Ref ref) {
  return ProjectRepositoryImpl(
    remoteDatasource: ref.read(
      projectRemoteDatasourceProvider,
    ),
  );
}

@riverpod
SaveProjectUseCase saveProject(Ref ref) {
  return SaveProjectUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
GetProjectsUseCase getProjects(Ref ref) {
  return GetProjectsUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
GetProjectUseCase getProject(Ref ref) {
  return GetProjectUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
ScheduleProjectUseCase scheduleProject(Ref ref) {
  return ScheduleProjectUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
ToggleLikeUseCase toggleLike(Ref ref) {
  return ToggleLikeUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
GetUserLikedProjectsUseCase getUserLikedProjects(Ref ref) {
  return GetUserLikedProjectsUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}
