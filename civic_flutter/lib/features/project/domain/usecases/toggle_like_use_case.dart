import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class ToggleLikeUseCase implements UseCase<int, ToggleLikeParams> {
  ToggleLikeUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, int>> call(ToggleLikeParams params) async {
    final result = await _projectRepository.toggleLike(
      id: params.id,
    );
    return result;
  }
}

class ToggleLikeParams {
  ToggleLikeParams(
    this.id,
  );
  final int id;
}
