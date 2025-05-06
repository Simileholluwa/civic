import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class SaveProjectReviewUseCase implements UseCase<ProjectReview, SaveProjectReviewParams> {
  SaveProjectReviewUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, ProjectReview>> call(SaveProjectReviewParams params) async {
    final result = await _projectRepository.saveProjectReview(
      projectReview: params.projectReview,
    );
    return result;
  }
}

class SaveProjectReviewParams {
  SaveProjectReviewParams(
    this.projectReview,
  );
  final ProjectReview projectReview;
}
