import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class GetPostCommentsUseCase implements UseCase<PostList, GetPostCommentsParams> {
  GetPostCommentsUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, PostList>> call(GetPostCommentsParams params) async {
    final result = await _postRepository.getPostComments(
      postId: params.postId,
      page: params.page,
      limit: params.limit,
      
    );
    return result;
  }
}

class GetPostCommentsParams {
  GetPostCommentsParams(
    this.postId,
    this.page,
    this.limit,
  );
  final int postId;
  final int page;
  final int limit;
  
}
