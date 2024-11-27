import 'dart:async';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
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
  Future<Either<Failure, Post?>> savePost({required Post post}) async {
    try {
      final result = await _remoteDatabase.savePost(post: post);
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
  Future<Either<Failure, PostList>> getPosts({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _remoteDatabase.getPosts(
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
  Future<Either<String, Post?>> getPost({required int id}) async {
    try {
      final result = await _remoteDatabase.getPost(
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
  Either<Failure, List<DraftPost>?> getDrafts() {
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
  Future<Either<Failure, void>> deleteDraft({
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
  Future<Either<Failure, List<DraftPost>>> deleteDrafts() async {
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
  Future<Either<Failure, void>> schedulePost({
    required Post post,
    required DateTime dateTime,
  }) async {
    try {
      final result = await _remoteDatabase.schedulePost(
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
