import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class ClearProjectBookmarksUseCase implements UseCase<void, NoParams> {
  ClearProjectBookmarksUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await _projectRepository.clearProjectBookmarks();
    return result;
  }
}
