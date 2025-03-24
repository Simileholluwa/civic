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
  Future<Either<Failure, Post?>> savePost({
    required Post post,
    bool isProjectRepost = false,
    int? projectId,
  }) async {
    try {
      final result = await _remoteDatabase.savePost(
        post: post,
        isProjectRepost: isProjectRepost,
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

  @override
  Future<Either<Failure, int>> toggleLike({
    required int id,
  }) async {
    try {
      final result = await _remoteDatabase.toggleLike(
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
  Future<Either<Failure, List<int>>> getUserLikedPosts() async {
    try {
      final result = await _remoteDatabase.getUserLikedProjects();
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
  Future<Either<Failure, void>> deletePost({required int id}) async {
    try {
      final result = await _remoteDatabase.deletePost(
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
  Future<Either<Failure, void>> deletePostComment({required int id}) async {
    try {
      final result = await _remoteDatabase.deletePostComment(
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
  Future<Either<Failure, PostCommentList>> getPostComments({
    required int postId,
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _remoteDatabase.getPostComments(
        postId: postId,
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
  Future<Either<Failure, PostComment>> savePostComment({
    required int postId,
    required PostComment comment,
  }) async {
    try {
      final result = await _remoteDatabase.savePostComment(
        postId: postId,
        comment: comment,
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
  Future<Either<Failure, int>> toggleCommentLike({required int id}) async {
    try {
      final result = await _remoteDatabase.toggleCommentLike(
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
  Future<Either<Failure, PostCommentList>> getPostCommentReplies({
    required int commentId,
    required int postId,
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _remoteDatabase.getPostCommentReplies(
        commentId: commentId,
        postId: postId,
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
}
