import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class GetProjectDraftsUseCase implements UseCase<List<Project>, NoParams> {
  GetProjectDraftsUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, List<Project>>> call(NoParams params) async {
    final result = await _projectRepository.getProjectDrafts();
    return result;
  }
}
