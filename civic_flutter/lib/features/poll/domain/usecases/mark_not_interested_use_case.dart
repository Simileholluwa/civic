import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class MarkPollNotInterestedUseCase implements UseCase<void, MarkPollNotInterestedParams> {
  MarkPollNotInterestedUseCase({required PollRepository pollRepository})
      : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, void>> call(MarkPollNotInterestedParams params) async {
    final result = await _pollRepository.markNotInterested(
      id: params.id,
      reason: params.reason,
    );
    return result;
  }
}

class MarkPollNotInterestedParams {
  MarkPollNotInterestedParams(
    this.id,
    this.reason,
  );
  final int id;
  final String reason;
}
