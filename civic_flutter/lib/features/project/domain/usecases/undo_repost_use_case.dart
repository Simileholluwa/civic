import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class UndoRepostUseCase implements UseCase<void, UndoRepostParams> {
  UndoRepostUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(UndoRepostParams params) async {
    final result = await _projectRepository.undoRepost(
      projectId: params.projectId,      
    );
    return result;
  }
}

class UndoRepostParams {
  UndoRepostParams(
    this.projectId,
    
  );
  final int projectId;

}
