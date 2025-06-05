import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class SavePollDraftUseCase implements UseCase<void, SavePollDraftParams> {
  SavePollDraftUseCase({required PollRepository pollRepository})
      : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, void>> call(SavePollDraftParams params) async {
    final result = await _pollRepository.savePollDraft(
      poll: params.poll,
    );
    return result;
  }
}

class SavePollDraftParams {
  SavePollDraftParams(
    this.poll,
  );
  final Poll poll;
}
