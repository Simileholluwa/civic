import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class DeleteProjectVettingUseCase
    implements UseCase<void, DeleteProjectVettingParams> {
  DeleteProjectVettingUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(DeleteProjectVettingParams params) async {
    final result = await _projectRepository.deleteProjectVetting(
      vettingId: params.vettingId,
    );
    return result;
  }
}

class DeleteProjectVettingParams {
  DeleteProjectVettingParams(
    this.vettingId,
  );
  final int vettingId;
}
