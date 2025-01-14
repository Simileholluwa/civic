import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class GetUserLikedProjectsUseCase implements UseCase<List<int>, NoParams> {
  GetUserLikedProjectsUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, List<int>>> call(NoParams params) async {
    final result = await _projectRepository.getUserLikedProjects();
    return result;
  }
}
