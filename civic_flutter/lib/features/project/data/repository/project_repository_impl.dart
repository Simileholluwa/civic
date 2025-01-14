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
  Future<Either<Failure, Project?>> saveProject(
      {required Project project}) async {
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
  Future<Either<Failure, int>> toggleLike({
    required int id,
  }) async {
    try {
      final result = await _remoteDatasource.toggleLike(
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
  Future<Either<Failure, List<int>>> getUserLikedProjects() async {
    try {
      final result = await _remoteDatasource.getUserLikedProjects();
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
