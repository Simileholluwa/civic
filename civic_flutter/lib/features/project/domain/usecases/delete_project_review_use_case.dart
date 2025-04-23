import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class DeleteProjectReviewUseCase implements UseCase<void, DeleteProjectReviewParams> {
  DeleteProjectReviewUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(DeleteProjectReviewParams params) async {
    final result = await _projectRepository.deleteProjectReview(
      id: params.id,
    );
    return result;
  }
}

class DeleteProjectReviewParams {
  DeleteProjectReviewParams(
    this.id,
  );
  final int id;
}
