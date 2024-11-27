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
  Future<Either<Failure, void>> castVote({
    required int pollId,
    required int optionId,
  });
  Future<Either<Failure, List<DraftPoll>>> deleteDraftsPoll();
  Future<Either<Failure, void>> deleteDraftPoll({
    required DraftPoll draftPoll,
  });
 Either<Failure, List<DraftPoll>?> getDraftPolls();
  Future<Either<Failure, void>> saveDraftPoll({
    required DraftPoll draftPoll,
  });
}