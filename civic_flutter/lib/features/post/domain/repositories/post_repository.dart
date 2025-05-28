import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

abstract class PostRepository {
  Future<Either<Failure, Post?>> savePost({
    required Post post,
  });
  Future<Either<Failure, void>> schedulePost({
    required Post post,
    required DateTime dateTime,
  });
  Future<Either<Failure, void>> savePostDraft({required Post post});
  Future<Either<Failure, void>> getComment({
    required int commentId,
    required bool isComment,
  });
  Future<Either<Failure, PostList>> getPosts({
    required int page,
    required int limit,
  });
  Future<Either<Failure, Post>> getPostDraft();
  Future<Either<Failure, Post>> getPost({required int id});
  Future<Either<Failure, Post>> repostOrQuote({
    required int? projectId,
    required Post? quoteContent,
  });
  Future<Either<Failure, void>> deletePostDraft();

  Future<Either<Failure, void>> toggleLike({required int id});
  Future<Either<Failure, void>> toggleBookmark({required int id});
  Future<Either<Failure, void>> markNotInterested({required int id});
  Future<Either<Failure, void>> deletePost({required int id});
  Future<Either<Failure, void>> deletePostComment({required int id});
  Future<Either<Failure, int>> toggleCommentLike({required int id});
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
}
