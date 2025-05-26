import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class GetPostCommentRepliesUseCase implements UseCase<PostList, GetPostCommentRepliesParams> {
  GetPostCommentRepliesUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, PostList>> call(GetPostCommentRepliesParams params) async {
    final result = await _postRepository.getPostCommentReplies(
      commentId: params.commentId,
      page: params.page,
      limit: params.limit,
      
    );
    return result;
  }
}

class GetPostCommentRepliesParams {
  GetPostCommentRepliesParams(
    this.commentId,
    this.page,
    this.limit,
  );
  final int commentId;
  final int page;
  final int limit;
  
}
