import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class GetProjectsUseCase implements UseCase<ProjectList, GetProjectsParams> {
  GetProjectsUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, ProjectList>> call(GetProjectsParams params) async {
    final result = await _projectRepository.getProjects(
      page: params.page,
      limit: params.limit,
      sortBy: params.sortBy,
    );
    return result;
  }
}

class GetProjectsParams {
  GetProjectsParams(
    this.page,
    this.limit,
    this.sortBy,
  );
  final int page;
  final int limit;
  final String sortBy;
}
