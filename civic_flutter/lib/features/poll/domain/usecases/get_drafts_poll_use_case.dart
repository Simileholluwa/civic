import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class GetPollDraftUseCase implements UseCase<Poll, NoParams> {
  GetPollDraftUseCase({required PollRepository pollRepository})
      : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, Poll>> call(NoParams params) {
    final result = _pollRepository.getPollDraft();
    return result;
  }
}
