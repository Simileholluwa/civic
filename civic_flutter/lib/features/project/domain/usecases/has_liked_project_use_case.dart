import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class HasLikedProjectUseCase implements UseCase<bool, HasLikedProjectParams> {
  HasLikedProjectUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, bool>> call(HasLikedProjectParams params) async {
    final result = await _projectRepository.hasLikedProject(
      id: params.id,
    );
    return result;
  }
}

class HasLikedProjectParams {
  HasLikedProjectParams(
    this.id,
  );
  final int id;
}
