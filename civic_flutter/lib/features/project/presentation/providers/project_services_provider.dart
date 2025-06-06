// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
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
ProjectLocalDataSourceImpl projectLocalDatasource(Ref ref) {
  return ProjectLocalDataSourceImpl(
    prefs: ref.read(localStorageProvider),
  );
}

@riverpod
ProjectRepositoryImpl projectRepositoryImpl(Ref ref) {
  return ProjectRepositoryImpl(
    remoteDatasource: ref.read(
      projectRemoteDatasourceProvider,
    ),
    localDatasource: ref.read(
      projectLocalDatasourceProvider,
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
SaveProjectReviewUseCase saveProjectReview(Ref ref) {
  return SaveProjectReviewUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
GetProjectReviewsUseCase getProjectReviews(Ref ref) {
  return GetProjectReviewsUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
GetProjectReviewUseCase getProjectReview(Ref ref) {
  return GetProjectReviewUseCase(
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
ReactToProjectReviewUseCase reactToProjectReview(Ref ref) {
  return ReactToProjectReviewUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
ReactToProjectVettingUseCase reactToProjectVetting(Ref ref) {
  return ReactToProjectVettingUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
ToggleBookmarkUseCase toggleBookmark(Ref ref) {
  return ToggleBookmarkUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
DeleteProjectUseCase deleteProject(Ref ref) {
  return DeleteProjectUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
MarkNotInterestedUseCase notInterestedProject(Ref ref) {
  return MarkNotInterestedUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
DeleteProjectReviewUseCase deleteProjectReview(Ref ref) {
  return DeleteProjectReviewUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
DeleteProjectVettingUseCase deleteProjectVetting(Ref ref) {
  return DeleteProjectVettingUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
VetProjectUseCase vetProject(Ref ref) {
  return VetProjectUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
GetVettedProjectUseCase getVettedProject(Ref ref) {
  return GetVettedProjectUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
GetVettedProjectsUseCase getVettedProjects(Ref ref) {
  return GetVettedProjectsUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
GetProjectDraftUseCase getProjectDraft(Ref ref) {
  return GetProjectDraftUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
SaveProjectDraftUseCase saveProjectDraft(Ref ref) {
  return SaveProjectDraftUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
DeleteProjectDraftUseCase deleteProjectDraft(Ref ref) {
  return DeleteProjectDraftUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}