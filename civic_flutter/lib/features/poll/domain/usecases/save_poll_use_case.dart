import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class SavePollUseCase implements UseCase<Poll?, SavePollParams> {
  SavePollUseCase({
    required PollRepository pollRepository,
  }) : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, Poll?>> call(SavePollParams params) async {
    final result = await _pollRepository.savePoll(
      poll: params.poll,
    );
    return result;
  }
}

class SavePollParams {
  SavePollParams(
    this.poll,
  );
  final Poll poll;
}
