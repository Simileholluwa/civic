import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class CastVoteUseCase implements UseCase<void, CastVoteParams> {
  CastVoteUseCase({
    required PollRepository pollRepository,
  }) : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, void>> call(CastVoteParams params) async {
    final result = await _pollRepository.castVote(
      pollId: params.pollId,
      option: params.option,
    );
    return result;
  }
}

class CastVoteParams {
  CastVoteParams(
    this.pollId,
    this.option,
  );
  final int pollId;
  final String option;
}
