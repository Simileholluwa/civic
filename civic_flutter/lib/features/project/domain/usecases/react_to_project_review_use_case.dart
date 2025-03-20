import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class ReactToProjectReviewUseCase implements UseCase<void, ReactToProjectReviewParams> {
  ReactToProjectReviewUseCase({required ProjectRepository projectRepository})
      : _projectRepository = projectRepository;
  final ProjectRepository _projectRepository;

  @override
  Future<Either<Failure, void>> call(ReactToProjectReviewParams params) async {
    final result = await _projectRepository.reactToReview(
      reviewId: params.reviewId,
      isLike: params.isLike,
    );
    return result;
  }
}

class ReactToProjectReviewParams {
  ReactToProjectReviewParams(
    this.reviewId,
    this.isLike
  );
  final int reviewId;
  final bool isLike;
}
