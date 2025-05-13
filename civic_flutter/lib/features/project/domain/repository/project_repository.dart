import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

abstract class ProjectRepository {
  Future<Either<Failure, ProjectList>> getProjects({
    required int page,
    required int limit,
  });

  Future<Either<Failure, ProjectVetList>> getVettedProjects({
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

  Future<Either<Failure, ProjectReview>> reactToReview({
    required int reviewId,
    required bool isLike,
  });

  Future<Either<Failure, ProjectVetting>> reactToVetting({
    required int vettingId,
    required bool isLike,
  });

  Future<Either<String, Project>> getProject({
    required int id,
  });

  Future<Either<Failure, Project>> getProjectDraft();

  Future<Either<Failure, void>> saveProjectDraft({required Project project,});

  Future<Either<Failure, void>> deleteProjectDraft();

  Future<Either<Failure, Project>> saveProject({
    required Project project,
  });

  Future<Either<Failure, ProjectReview?>> getProjectReview({
    required int id,
  });

  Future<Either<Failure, void>> deleteProjectReview({
    required int id,
  });

  Future<Either<Failure, void>> deleteProjectVetting({
    required int vettingId,
  });

  Future<Either<Failure, ProjectReview>> saveProjectReview({
    required ProjectReview projectReview,
  });

  Future<Either<Failure, void>> scheduleProject({
    required Project project,
    required DateTime dateTime,
  });

  Future<Either<Failure, void>> deleteProject({required int id});

  Future<Either<Failure, void>> toggleLike({
    required int projectId,
  });

  Future<Either<Failure, void>> toggleBookmark({
    required int projectId,   
  });

  Future<Either<Failure, void>> undoRepost({
    required int projectId,   
  });

  Future<Either<Failure, void>> markNotInterested({
    required int projectId,   
  });

  Future<Either<Failure, ProjectVetting?>> getVettedProject({
    required int projectId,   
  });

  Future<Either<Failure, ProjectVetting>> vetProject({
    required ProjectVetting projectVetting,   
  });


}
