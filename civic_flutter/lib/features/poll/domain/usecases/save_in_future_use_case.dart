import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/poll/domain/repositories/poll_repository.dart';
import 'package:fpdart/fpdart.dart';

class SavePollInFutureUseCase implements UseCase<void, SavePollInFutureParams> {
  SavePollInFutureUseCase({
    required PollRepository pollRepository,
  }) : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, void>> call(SavePollInFutureParams params) async {
    final result = await _pollRepository.saveInFuture(
      poll: params.poll,
      scheduledDatetime: params.scheduledDatetime,
    );
    return result;
  }
}

class SavePollInFutureParams {
  SavePollInFutureParams(
    this.poll,
    this.scheduledDatetime,
  );
  final Poll poll;
  final DateTime scheduledDatetime;
}
