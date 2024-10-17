import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/poll/domain/repositories/poll_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteAllDraftPollUseCase implements UseCase<List<DraftPoll>, NoParams> {
  DeleteAllDraftPollUseCase({
    required PollRepository pollRepository,
  }) : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, List<DraftPoll>>> call(NoParams params) async {
    final result = await _pollRepository.removeAllDraftPoll();
    return result;
  }
}
