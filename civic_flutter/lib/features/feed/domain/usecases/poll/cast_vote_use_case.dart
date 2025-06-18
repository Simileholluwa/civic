import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class CastVoteUseCase implements UseCase<void, CastVoteParams> {
  CastVoteUseCase({
    required FeedRepository feedRepository,
  }) : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(CastVoteParams params) async {
    final result = await _feedRepository.castVote(
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
