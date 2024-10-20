import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class PollRepository {
  Future<Either<Failure, Poll?>> save({
    required Poll poll,
  });
  Future<Either<Failure, void>> saveInFuture({
    required Poll poll,
    required DateTime scheduledDatetime,
  });
  Future<Either<Failure, Poll?>> retrieve({
    required int id,
  });
  Future<Either<Failure, void>> castVote({
    required int pollId,
    required int optionId,
  });
  Future<Either<Failure, List<DraftPoll>>> removeAllDraftPoll();
  Future<Either<Failure, void>> deleteDraftPoll({
    required DraftPoll draftPoll,
  });
 Either<Failure, List<DraftPoll>?> retrieveDrafts();
  Future<Either<Failure, void>> saveDraft({
    required DraftPoll draftPoll,
  });
}