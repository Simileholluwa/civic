import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class SaveProjectDraftUseCase implements UseCase<void, SaveProjectDraftParams> {
  SaveProjectDraftUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(SaveProjectDraftParams params) async {
    final result = await _projectRepository.saveProjectDraft(
      project: params.project,
    );
    return result;
  }
}

class SaveProjectDraftParams {
  SaveProjectDraftParams(
    this.project,
  );
  final Project project;
}
