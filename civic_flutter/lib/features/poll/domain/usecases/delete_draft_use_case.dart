import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class DeletePollDraftUseCase implements UseCase<void, NoParams> {
  DeletePollDraftUseCase({required PollRepository pollRepository})
      : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await _pollRepository.deletePollDraft();
    return result;
  }
}
