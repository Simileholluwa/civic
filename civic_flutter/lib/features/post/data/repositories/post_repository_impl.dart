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
  }) async {
    try {
      final result = await _remoteDatabase.savePost(
        post: post,
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
  Future<Either<Failure, Post>> getPost({
    required int postId,
    required PostType postType,
  }) async {
    try {
      final result = await _remoteDatabase.getPost(
        postId: postId,
        postType: postType,
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
  Future<Either<Failure, Post>> getComment({
    required int commentId,
    required bool isComment,
  }) async {
    try {
      final result = await _remoteDatabase.getComment(
        commentId: commentId,
        isComment: isComment,
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
  Future<Either<Failure, Post>> quoteProject({
    required int projectId,
    required Post quoteContent,
  }) async {
    try {
      final result = await _remoteDatabase.quoteProject(
        projectId: projectId,
        quoteContent: quoteContent,
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
  Future<Either<Failure, void>> savePostDraft({
    required Post post,
    required String draftType,
  }) async {
    try {
      final result = await _localDatabase.savePostDraft(
        post: post,
        draftType: draftType,
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
  Future<Either<Failure, Post>> getPostDraft({
    required String draftType,
  }) async {
    try {
      final result = await _localDatabase.getPostDraft(
        draftType: draftType,
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
  Future<Either<Failure, void>> deletePostDraft({
    required String draftType,
  }) async {
    try {
      final result = await _localDatabase.deletePostDraft(
        draftType: draftType,
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
  Future<Either<Failure, void>> toggleLike({
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
  Future<Either<Failure, void>> toggleBookmark({
    required int id,
  }) async {
    try {
      final result = await _remoteDatabase.toggleBookmark(
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
  Future<Either<Failure, void>> markNotInterested({
    required int id,
    required String reason,
  }) async {
    try {
      final result = await _remoteDatabase.markNotInterested(
        id: id,
        reason: reason,
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
  Future<Either<Failure, void>> deletePost({
    required int postId,
  }) async {
    try {
      final result = await _remoteDatabase.deletePost(
        postId: postId,
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
  Future<Either<Failure, PostList>> getPostComments({
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
  Future<Either<Failure, Post>> savePostComment({
    required Post comment,
    required bool isReply,
  }) async {
    try {
      final result = await _remoteDatabase.savePostComment(
        comment: comment,
        isReply: isReply,
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
  Future<Either<Failure, PostList>> getPostCommentReplies({
    required int commentId,
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _remoteDatabase.getPostCommentReplies(
        commentId: commentId,
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
  Future<Either<Failure, void>> castVote({
    required int pollId,
    required int optionId,
  }) async {
    try {
      final result = await _remoteDatabase.castVote(
        pollId: pollId,
        optionId: optionId,
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
  Future<Either<Failure, Post?>> savePoll({
    required Post post,
  }) async {
    try {
      final result = await _remoteDatabase.savePoll(
        post: post,
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
  Future<Either<Failure, PostList>> getPolls({
    required int page,
    required int limit,
  }) async {
    try {
      final result = await _remoteDatabase.getPolls(
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
