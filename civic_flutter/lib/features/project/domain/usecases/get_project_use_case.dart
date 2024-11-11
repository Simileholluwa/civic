import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/project/domain/repository/project_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProjectUseCase implements StringUseCase<Project?, GetProjectParams> {
  GetProjectUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<String, Project?>> call(GetProjectParams params) async {
    final result = await _projectRepository.getProject(
      id: params.id,
    );
    return result;
  }
}

class GetProjectParams {
  GetProjectParams(
    this.id,
  );
  final int id;
}
