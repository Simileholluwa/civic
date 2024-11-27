import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class DeleteProjectUseCase implements UseCase<void, DeleteProjectParams> {
  DeleteProjectUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(DeleteProjectParams params) async {
    final result = await _projectRepository.deleteProject(
      id: params.id,
    );
    return result;
  }
}

class DeleteProjectParams {
  DeleteProjectParams(
    this.id,
  );
  final int id;
}
