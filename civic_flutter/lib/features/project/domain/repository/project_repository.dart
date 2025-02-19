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

  Future<Either<Failure, int>> toggleLike({required int id});
  
  Future<Either<Failure, List<int>>> getUserLikedProjects();
}
