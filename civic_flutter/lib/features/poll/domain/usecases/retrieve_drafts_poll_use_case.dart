import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/poll/domain/repositories/poll_repository.dart';
import 'package:fpdart/fpdart.dart';

class RetrieveDraftPollUseCase
    implements NotFutureUseCase<List<DraftPoll>?, NoParams> {
  RetrieveDraftPollUseCase({required PollRepository pollRepository})
      : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Either<Failure, List<DraftPoll>?> call(NoParams params) {
    final result = _pollRepository.retrieveDrafts();
    return result;
  }
}
