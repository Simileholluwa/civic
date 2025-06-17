import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class CastVoteUseCase implements UseCase<void, CastVoteParams> {
  CastVoteUseCase({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(CastVoteParams params) async {
    final result = await _postRepository.castVote(
      postId: params.postId,
      optionId: params.optionId,
    );
    return result;
  }
}

class CastVoteParams {
  CastVoteParams(
    this.postId,
    this.optionId,
  );
  final int postId;
  final int optionId;
}
