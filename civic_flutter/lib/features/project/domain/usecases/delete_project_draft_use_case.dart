import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class DeleteProjectDraftUseCase implements UseCase<void, NoParams> {
  DeleteProjectDraftUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await _projectRepository.deleteProjectDraft();
    return result;
  }
}
