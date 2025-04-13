import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class MarkNotInterestedUseCase implements UseCase<void, MarkNotInterestedParams> {
  MarkNotInterestedUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(MarkNotInterestedParams params) async {
    final result = await _projectRepository.markNotInterested(
      projectId: params.projectId,      
    );
    return result;
  }
}

class MarkNotInterestedParams {
  MarkNotInterestedParams(
    this.projectId,
    
  );
  final int projectId;

}
