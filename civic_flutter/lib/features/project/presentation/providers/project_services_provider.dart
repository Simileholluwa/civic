// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/features/project/data/datasources/project_remote_datasource.dart';
import 'package:civic_flutter/features/project/data/repository/project_repository_impl.dart';
import 'package:civic_flutter/features/project/domain/usecases/get_project_use_case.dart';
import 'package:civic_flutter/features/project/domain/usecases/get_projects_use_case.dart';
import 'package:civic_flutter/features/project/domain/usecases/save_project_use_case.dart';
import 'package:civic_flutter/features/project/domain/usecases/schedule_project_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_services_provider.g.dart';

@riverpod
ProjectRemoteDatasourceImpl projectRemoteDatasource(ProjectRemoteDatasourceRef ref) {
  return ProjectRemoteDatasourceImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
ProjectRepositoryImpl projectRepositoryImpl(ProjectRepositoryImplRef ref) {
  return ProjectRepositoryImpl(
    remoteDatasource: ref.read(
      projectRemoteDatasourceProvider,
    ),
  );
}

@riverpod
SaveProjectUseCase saveProject(SaveProjectRef ref) {
  return SaveProjectUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
GetProjectsUseCase getProjects(GetProjectsRef ref) {
  return GetProjectsUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
GetProjectUseCase getProject(GetProjectRef ref) {
  return GetProjectUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}

@riverpod
ScheduleProjectUseCase scheduleProject(ScheduleProjectRef ref) {
  return ScheduleProjectUseCase(
    projectRepository: ref.read(projectRepositoryImplProvider),
  );
}
