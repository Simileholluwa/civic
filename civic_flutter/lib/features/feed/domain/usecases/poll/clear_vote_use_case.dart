import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class ClearVoteUseCase implements UseCase<void, int> {
  ClearVoteUseCase({
    required FeedRepository feedRepository,
  }) : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(int params) async {
    final result = await _feedRepository.clearVote(
      pollId: params,
    );
    return result;
  }
}
