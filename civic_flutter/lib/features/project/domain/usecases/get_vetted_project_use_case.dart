import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class GetVettedProjectUseCase
    implements UseCase<ProjectVetting?, GetVettedProjectParams> {
  GetVettedProjectUseCase({
    required ProjectRepository projectRepository,
  }) : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, ProjectVetting?>> call(
    GetVettedProjectParams params,
  ) async {
    final result = await _projectRepository.getVettedProject(
      projectId: params.projectId,
    );
    return result;
  }
}

class GetVettedProjectParams {
  GetVettedProjectParams(
    this.projectId,
  );
  final int projectId;
}
