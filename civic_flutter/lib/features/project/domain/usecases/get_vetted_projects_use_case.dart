import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class GetVettedProjectsUseCase
    implements UseCase<ProjectVetList, GetVettedProjectsParams> {
  GetVettedProjectsUseCase({
    required ProjectRepository projectRepository,
  }) : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, ProjectVetList>> call(
    GetVettedProjectsParams params,
  ) async {
    final result = await _projectRepository.getVettedProjects(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetVettedProjectsParams {
  GetVettedProjectsParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
