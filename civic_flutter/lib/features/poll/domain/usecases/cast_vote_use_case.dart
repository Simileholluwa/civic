import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/poll/domain/repositories/poll_repository.dart';
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
      optionId: params.optionId,
    );
    return result;
  }
}

class CastVoteParams {
  CastVoteParams(
    this.pollId,
    this.optionId,
  );
  final int pollId;
  final int optionId;
}
