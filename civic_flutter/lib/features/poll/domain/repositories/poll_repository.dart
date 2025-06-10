import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

abstract class PollRepository {
  Future<Either<Failure, Poll?>> savePoll({
    required Poll poll,
  });
  Future<Either<Failure, void>> schedulePoll({
    required Poll poll,
    required DateTime scheduledDatetime,
  });
  Future<Either<Failure, Poll?>> getPoll({
    required int id,
  });
  Future<Either<Failure, PollList>> getPolls({
    required int page,
    required int limit,
  });
  Future<Either<Failure, void>> castVote({
    required int pollId,
    required int optionId,
  });
  Future<Either<Failure, void>> deletePollDraft();
  Future<Either<Failure, Poll>> getPollDraft();
  Future<Either<Failure, void>> savePollDraft({
    required Poll poll,
  });
  Future<Either<Failure, void>> toggleLike({required int id});
  Future<Either<Failure, void>> toggleBookmark({required int id});
  Future<Either<Failure, void>> markNotInterested({
    required int id,
    required String reason,
  });
  Future<Either<Failure, void>> deletePoll({required int id});
}
