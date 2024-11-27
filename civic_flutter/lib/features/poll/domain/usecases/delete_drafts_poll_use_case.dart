import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class DeleteDraftsPollUseCase implements UseCase<List<DraftPoll>, NoParams> {
  DeleteDraftsPollUseCase({
    required PollRepository pollRepository,
  }) : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, List<DraftPoll>>> call(NoParams params) async {
    final result = await _pollRepository.deleteDraftsPoll();
    return result;
  }
}
