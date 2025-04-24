import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class VetProjectUseCase implements UseCase<ProjectVetting, VetProjectParams> {
  VetProjectUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, ProjectVetting>> call(VetProjectParams params) async {
    final result = await _projectRepository.vetProject(
      projectVetting: params.projectVetting,      
    );
    return result;
  }
}

class VetProjectParams {
  VetProjectParams(
    this.projectVetting,
    
  );
  final ProjectVetting projectVetting;

}
