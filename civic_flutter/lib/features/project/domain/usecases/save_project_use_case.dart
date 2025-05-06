import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class SaveProjectUseCase implements UseCase<Project, SaveProjectParams> {
  SaveProjectUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, Project>> call(SaveProjectParams params) async {
    final result = await _projectRepository.saveProject(
      project: params.project,
    );
    return result;
  }
}

class SaveProjectParams {
  SaveProjectParams(
    this.project,
  );
  final Project project;
}
