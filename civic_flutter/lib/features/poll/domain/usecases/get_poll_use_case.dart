import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class GetPollUseCase implements UseCase<Poll?, GetPollParams> {
  GetPollUseCase({
    required PollRepository pollRepository,
  }) : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, Poll?>> call(GetPollParams params) async {
    final result = await _pollRepository.getPoll(
      id: params.id,
    );
    return result;
  }
}

class GetPollParams {
  GetPollParams(
    this.id,
  );
  final int id;
}
