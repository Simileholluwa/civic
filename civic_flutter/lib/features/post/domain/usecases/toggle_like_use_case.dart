import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class TogglePostLikeUseCase implements UseCase<void, TogglePostLikeParams> {
  TogglePostLikeUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(TogglePostLikeParams params) async {
    final result = await _postRepository.toggleLike(
      id: params.id,
    );
    return result;
  }
}

class TogglePostLikeParams {
  TogglePostLikeParams(
    this.id,
  );
  final int id;
}
