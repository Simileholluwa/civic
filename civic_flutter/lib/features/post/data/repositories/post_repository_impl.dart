import 'dart:async';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/features/post/data/datasources/post_local_database.dart';
import 'package:civic_flutter/features/post/data/datasources/post_remote_database.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl({
    required PostRemoteDatabaseImpl remoteDatabase,
    required PostLocalDatabaseImpl localDatabase,
  })  : _remoteDatabase = remoteDatabase,
        _localDatabase = localDatabase;
  final PostRemoteDatabaseImpl _remoteDatabase;
  final PostLocalDatabaseImpl _localDatabase;
  @override
  Future<Either<Failure, Post?>> save({required Post post}) async {
    try {
      final result = await _remoteDatabase.save(post: post);
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
  Future<Either<Failure, PostList>> listPost({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _remoteDatabase.listPost(
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
  Future<Either<String, Post?>> retrieve({required int id}) async {
    try {
      final result = await _remoteDatabase.retrieve(
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
  Future<Either<Failure, void>> saveDraft({
    required DraftPost draftPost,
  }) async {
    try {
      final result = await _localDatabase.saveDraft(draftPost: draftPost);
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
  Either<Failure, List<DraftPost>?> retrieveDrafts() {
    try {
      final result = _localDatabase.retrieveDrafts();
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
  Future<Either<Failure, void>> deleteDraftPost({
    required DraftPost draftPost,
  }) async {
    try {
      final result = await _localDatabase.deleteDraftPost(draftPost: draftPost);
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
  Future<Either<Failure, List<DraftPost>>> removeAllDraftPost() async {
    try {
      final result = await _localDatabase.removeAllDraftPost();
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
  Future<Either<Failure, void>> saveInFuture({
    required Post post,
    required DateTime dateTime,
  }) async {
    try {
      final result = await _remoteDatabase.saveInFuture(
        post: post,
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
}
