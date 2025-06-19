import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

abstract class FeedRepository {
  Future<Either<Failure, Post?>> savePost({
    required Post post,
  });
  Future<Either<Failure, void>> schedulePost({
    required Post post,
    required DateTime dateTime,
  });
  Future<Either<Failure, void>> saveDraft({
    required Post post,
    required String draftType,
  });
  Future<Either<Failure, Post>> getComment({
    required int commentId,
    required bool isComment,
  });
  Future<Either<Failure, PostList>> getPosts({
    required int page,
    required int limit,
  });
  Future<Either<Failure, Post>> getDraft({
    required String draftType,
  });
  Future<Either<Failure, Post>> getPost({
    required int postId,
  });
  Future<Either<Failure, Post>> quoteProject({
    required int projectId,
    required Post quoteContent,
  });
  Future<Either<Failure, void>> deleteDraft({
    required String draftType,
  });

  Future<Either<Failure, void>> toggleLike({
    required int id,
  });
  Future<Either<Failure, void>> toggleBookmark({
    required int id,
  });
  Future<Either<Failure, void>> markNotInterested({
    required int id,
    required String reason,
  });
  Future<Either<Failure, void>> deletePost({
    required int postId,
  });
  Future<Either<Failure, Post>> savePostComment({
    required Post comment,
    required bool isReply,
  });
  Future<Either<Failure, PostList>> getPostComments({
    required int postId,
    required int page,
    required int limit,
  });
  Future<Either<Failure, PostList>> getPostCommentReplies({
    required int commentId,
    required int page,
    required int limit,
  });
  Future<Either<Failure, Post?>> savePoll({
    required Post post,
  });
  Future<Either<Failure, PostList>> getPolls({
    required int page,
    required int limit,
  });
  Future<Either<Failure, void>> castVote({
    required int postId,
    required int optionId,
  });
  Future<Either<Failure, PostList>> getArticles({
    required int page,
    required int limit,
  });
  Future<Either<Failure, Post>> saveArticle({
    required Post post,
  });
}
