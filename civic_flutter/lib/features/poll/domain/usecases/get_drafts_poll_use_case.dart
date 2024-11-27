import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class GetDraftsPollUseCase
    implements NotFutureUseCase<List<DraftPoll>?, NoParams> {
  GetDraftsPollUseCase({required PollRepository pollRepository})
      : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Either<Failure, List<DraftPoll>?> call(NoParams params) {
    final result = _pollRepository.getDraftPolls();
    return result;
  }
}
