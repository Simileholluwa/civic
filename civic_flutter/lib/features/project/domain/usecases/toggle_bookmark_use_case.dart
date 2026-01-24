import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class ToggleBookmarkUseCase implements UseCase<void, ToggleBookmarkParams> {
  ToggleBookmarkUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(ToggleBookmarkParams params) async {
    final result = await _projectRepository.toggleBookmark(
      projectId: params.projectId,
    );
    return result;
  }
}

class ToggleBookmarkParams {
  ToggleBookmarkParams(
    this.projectId,
  );
  final int projectId;
}
