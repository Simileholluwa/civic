import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProjectRepository {
  Future<Either<Failure, ProjectList>> getProjects({
    required int page,
    required int limit,
  });
  Future<Either<Failure, ProjectReviewList>> getProjectReviews({
    required int projectId,
    required int page,
    required int limit,
    double? rating,
    String? cardinal,
  });

  Future<Either<Failure, ProjectReviewResponse?>> reactToReview({
    required int reviewId,
    required bool isLike,
  });

  Future<Either<String, Project?>> getProject({required int id});

  Future<Either<Failure, Project?>> saveProject({required Project project});

  Future<Either<String, ProjectReview?>> getProjectReview({required int id});

  Future<Either<Failure, ProjectReview?>> saveProjectReview({required ProjectReview projectReview,});

  Future<Either<Failure, void>> scheduleProject({
    required Project project,
    required DateTime dateTime,
  });

  Future<Either<Failure, void>> deleteProject({required int id});

  Future<Either<Failure, ProjectToggleLikeResponse>> toggleLike({required int id});
}
