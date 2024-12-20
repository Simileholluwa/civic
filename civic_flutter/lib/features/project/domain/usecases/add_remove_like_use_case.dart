import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class AddRemoveLikeUseCase implements UseCase<int, AddRemoveLikeParams> {
  AddRemoveLikeUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, int>> call(AddRemoveLikeParams params) async {
    final result = await _projectRepository.addRemoveLike(
      id: params.id,
    );
    return result;
  }
}

class AddRemoveLikeParams {
  AddRemoveLikeParams(
    this.id,
  );
  final int id;
}
