import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class DeletePollUseCase implements UseCase<void, DeletePollParams> {
  DeletePollUseCase({required PollRepository pollRepository})
      : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, void>> call(DeletePollParams params) async {
    final result = await _pollRepository.deletePoll(
      id: params.id,
    );
    return result;
  }
}

class DeletePollParams {
  DeletePollParams(
    this.id,
  );
  final int id;
}
