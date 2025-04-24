import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:fpdart/fpdart.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  ProjectRepositoryImpl({
    required ProjectRemoteDataSource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  final ProjectRemoteDataSource _remoteDatasource;

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
  Future<Either<String, Project?>> getProject({required int id}) async {
    try {
      final result = await _remoteDatasource.getProject(
        id: id,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        e.message,
      );
    }
  }

  @override
  Future<Either<Failure, ProjectList>> getProjects({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _remoteDatasource.getProjects(
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
  Future<Either<Failure, Project?>> saveProject({
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
  Future<Either<String, ProjectReview?>> getProjectReview({
    required int id,
  }) async {
    try {
      final result = await _remoteDatasource.getProjectReview(
        id: id,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        e.message,
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
  Future<Either<Failure, ProjectReview?>> saveProjectReview({
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
  Future<Either<Failure, void>> undoRepost({
    required int projectId,
  }) async {
    try {
      final result = await _remoteDatasource.undoRepost(
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
  Future<Either<Failure, ProjectVetting>> getVettedProject({
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
}
