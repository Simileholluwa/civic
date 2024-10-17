import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/poll/domain/repositories/poll_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteDraftPollUseCase implements UseCase<void, DeleteDraftPollParams> {
  DeleteDraftPollUseCase({required PollRepository pollRepository})
      : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, void>> call(DeleteDraftPollParams params) async {
    final result = await _pollRepository.deleteDraftPoll(
      draftPoll: params.draftPoll,
    );
    return result;
  }
}

class DeleteDraftPollParams {
  DeleteDraftPollParams(
    this.draftPoll,
  );
  final DraftPoll draftPoll;
}
