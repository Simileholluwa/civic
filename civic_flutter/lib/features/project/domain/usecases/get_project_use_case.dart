import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class GetProjectUseCase
    implements UseCase<ProjectWithUserState, GetProjectParams> {
  GetProjectUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, ProjectWithUserState>> call(
    GetProjectParams params,
  ) async {
    final result = await _projectRepository.getProject(
      id: params.id,
    );
    return result;
  }
}

class GetProjectParams {
  GetProjectParams(
    this.id,
  );
  final int id;
}
