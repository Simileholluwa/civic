import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

abstract class PostRepository {
  Future<Either<Failure, Post?>> savePost({
    required Post post,
    bool isProjectRepost = false,
    int? projectId,
  });
  Future<Either<Failure, void>> schedulePost({
    required Post post,
    required DateTime dateTime,
  });
  Future<Either<Failure, void>> saveDraft({required DraftPost draftPost});
  Future<Either<Failure, PostList>> getPosts({
    required int page,
    required int limit,
  });
  Either<Failure, List<DraftPost>?> getDrafts();
  Future<Either<String, Post?>> getPost({required int id});
  Future<Either<Failure, List<DraftPost>>> deleteDrafts();
  Future<Either<Failure, void>> deleteDraft({
    required DraftPost draftPost,
  });
  Future<Either<Failure, int>> toggleLike({required int id});
  Future<Either<Failure, List<int>>> getUserLikedPosts();
  Future<Either<Failure, void>> deletePost({required int id});
  Future<Either<Failure, void>> deletePostComment({required int id});
  Future<Either<Failure, int>> toggleCommentLike({required int id});
  Future<Either<Failure, PostComment>> savePostComment({
    required int postId,
    required PostComment comment,
  });
  Future<Either<Failure, PostCommentList>> getPostComments({
    required int postId,
    required int page,
    required int limit,
  });
  Future<Either<Failure, PostCommentList>> getPostCommentReplies({
    required int commentId,
    required int postId,
    required int page,
    required int limit,
  });
}
