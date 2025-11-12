import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  ProjectRepositoryImpl({
    required ProjectRemoteDataSource remoteDatasource,
    required ProjectLocalDataSource localDatasource,
  })  : _localDatasource = localDatasource,
        _remoteDatasource = remoteDatasource;

  final ProjectRemoteDataSource _remoteDatasource;
  final ProjectLocalDataSource _localDatasource;

  @override
  Future<Either<Failure, void>> deleteProject({required int id}) async {
    try {
      final result = await _remoteDatasource.deleteProject(
        id: id,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProjectWithUserState>> getProject({
    required int id,
  }) async {
    try {
      final result = await _remoteDatasource.getProject(
        id: id,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
          action: e.action,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, FeedProjectList>> getProjects({
    required int page,
    required int limit,
    required String sortBy,
  }) async {
    try {
      final result = await _remoteDatasource.getProjects(
        page: page,
        limit: limit,
        sortBy: sortBy,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> clearProjectBookmarks() async {
    try {
      final result = await _remoteDatasource.clearProjectBookmarks();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, FeedProjectList>> getUserProjectBookmarks({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _remoteDatasource.getUserProjectBookmarks(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProjectVetList>> getVettedProjects({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _remoteDatasource.getVettedProjects(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Project>> saveProject({
    required Project project,
  }) async {
    try {
      final result = await _remoteDatasource.saveProject(
        project: project,
      );

      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> scheduleProject({
    required Project project,
    required DateTime dateTime,
  }) async {
    try {
      final result = await _remoteDatasource.scheduleProject(
        project: project,
        dateTime: dateTime,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> toggleLike({
    required int projectId,
  }) async {
    try {
      final result = await _remoteDatasource.toggleLike(
        projectId: projectId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProjectReview?>> getProjectReview({
    required int id,
  }) async {
    try {
      final result = await _remoteDatasource.getProjectReview(
        id: id,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
          action: e.action,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProjectReviewList>> getProjectReviews({
    required int projectId,
    required int page,
    required int limit,
    double? rating,
    String? cardinal,
  }) async {
    try {
      final result = await _remoteDatasource.getProjectReviews(
        projectId: projectId,
        page: page,
        limit: limit,
        rating: rating,
        cardinal: cardinal,
      );

      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProjectReview>> saveProjectReview({
    required ProjectReview projectReview,
  }) async {
    try {
      final result = await _remoteDatasource.saveProjectReview(
        projectReview: projectReview,
      );

      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProjectReview>> reactToReview({
    required int reviewId,
    required bool isLike,
  }) async {
    try {
      final result = await _remoteDatasource.reactToReview(
        reviewId: reviewId,
        isLike: isLike,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProjectVetting>> reactToVetting({
    required int vettingId,
    required bool isLike,
  }) async {
    try {
      final result = await _remoteDatasource.reactToVetting(
        vettingId: vettingId,
        isLike: isLike,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> toggleBookmark({
    required int projectId,
  }) async {
    try {
      final result = await _remoteDatasource.toggleBookmark(
        projectId: projectId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> markNotInterested({
    required int projectId,
  }) async {
    try {
      final result = await _remoteDatasource.markNotInterested(
        projectId: projectId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteProjectReview({
    required int id,
  }) async {
    try {
      final result = await _remoteDatasource.deleteProjectReview(
        id: id,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteProjectVetting({
    required int vettingId,
  }) async {
    try {
      final result = await _remoteDatasource.deleteProjectVetting(
        vettingId: vettingId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProjectVetting>> vetProject({
    required ProjectVetting projectVetting,
  }) async {
    try {
      final result = await _remoteDatasource.vetProject(
        projectVetting: projectVetting,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProjectVetting?>> getVettedProject({
    required int projectId,
  }) async {
    try {
      final result = await _remoteDatasource.getVettedProject(
        projectId: projectId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteProjectDraft({
    required int projectId,
  }) async {
    try {
      final result = await _localDatasource.deleteProjectDraft(
        projectId: projectId,
      );
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Project>>> getProjectDrafts() async {
    try {
      final result = await _localDatasource.getProjectDrafts();
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> saveProjectDraft({
    required Project project,
  }) async {
    try {
      final result = await _localDatasource.saveProjectDraft(
        project: project,
      );
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllProjectDrafts() async {
    try {
      final result = await _localDatasource.deleteAllProjectDrafts();
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> subscribeToNotifications({
    required int id,
  }) async {
    try {
      final result = await _remoteDatasource.subscribeToNotifications(
        id: id,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }
}
