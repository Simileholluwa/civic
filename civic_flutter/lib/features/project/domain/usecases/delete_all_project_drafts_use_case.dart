import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class DeleteAllProjectDraftsUseCase implements UseCase<void, NoParams> {
  DeleteAllProjectDraftsUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await _projectRepository.deleteAllProjectDrafts();
    return result;
  }
}
