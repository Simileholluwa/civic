import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class GetPostCommentRepliesUseCase implements UseCase<PostCommentList, GetPostCommentRepliesParams> {
  GetPostCommentRepliesUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, PostCommentList>> call(GetPostCommentRepliesParams params) async {
    final result = await _postRepository.getPostCommentReplies(
      commentId: params.commentId,
      postId: params.postId,
      page: params.page,
      limit: params.limit,
      
    );
    return result;
  }
}

class GetPostCommentRepliesParams {
  GetPostCommentRepliesParams(
    this.postId,
    this.page,
    this.limit,
    this.commentId,
  );
  final int commentId;
  final int postId;
  final int page;
  final int limit;
  
}
