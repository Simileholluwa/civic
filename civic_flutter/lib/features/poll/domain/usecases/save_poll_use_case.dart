import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/poll/domain/repositories/poll_repository.dart';
import 'package:fpdart/fpdart.dart';

class SavePollUseCase implements UseCase<Poll?, SavePollParams> {
  SavePollUseCase({
    required PollRepository pollRepository,
  }) : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, Poll?>> call(SavePollParams params) async {
    final result = await _pollRepository.save(
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
