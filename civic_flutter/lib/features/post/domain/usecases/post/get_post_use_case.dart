import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class GetPostUseCase implements UseCase<Post, GetPostParams> {
  GetPostUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, Post>> call(GetPostParams params) async {
    final result = await _postRepository.getPost(
      postId: params.postId,
      postType: params.postType,
    );
    return result;
  }
}

class GetPostParams {
  GetPostParams(
    this.postId,
    this.postType,
  );
  final int postId;
  final PostType postType;
}
