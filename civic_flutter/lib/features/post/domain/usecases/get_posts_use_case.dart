import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetPostsUseCase implements UseCase<PostList, GetPostsParams> {
  GetPostsUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, PostList>> call(GetPostsParams params) async {
    final result = await _postRepository.getPosts(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetPostsParams {
  GetPostsParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
