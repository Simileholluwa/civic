import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/poll/domain/repositories/poll_repository.dart';
import 'package:fpdart/fpdart.dart';

class SchedulePollUseCase implements UseCase<void, SchedulePollParams> {
  SchedulePollUseCase({
    required PollRepository pollRepository,
  }) : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, void>> call(SchedulePollParams params) async {
    final result = await _pollRepository.schedulePoll(
      poll: params.poll,
      scheduledDatetime: params.scheduledDatetime,
    );
    return result;
  }
}

class SchedulePollParams {
  SchedulePollParams(
    this.poll,
    this.scheduledDatetime,
  );
  final Poll poll;
  final DateTime scheduledDatetime;
}
