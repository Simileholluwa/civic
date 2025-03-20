import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class ToggleLikeUseCase implements UseCase<void, ToggleLikeParams> {
  ToggleLikeUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(ToggleLikeParams params) async {
    final result = await _projectRepository.toggleLike(
      projectId: params.projectId,
    );
    return result;
  }
}

class ToggleLikeParams {
  ToggleLikeParams(
    this.projectId,
  );
  final int projectId;
}
