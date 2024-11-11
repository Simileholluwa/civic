import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/project/domain/repository/project_repository.dart';
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
    );
    return result;
  }
}

class GetProjectsParams {
  GetProjectsParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
