import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class GetUserLikedPostsUseCase implements UseCase<List<int>, NoParams> {
  GetUserLikedPostsUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, List<int>>> call(NoParams params) async {
    final result = await _postRepository.getUserLikedPosts();
    return result;
  }
}
