import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class TogglePollLikeUseCase implements UseCase<void, TogglePollLikeParams> {
  TogglePollLikeUseCase({required PollRepository pollRepository})
      : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, void>> call(TogglePollLikeParams params) async {
    final result = await _pollRepository.toggleLike(
      id: params.id,
    );
    return result;
  }
}

class TogglePollLikeParams {
  TogglePollLikeParams(
    this.id,
  );
  final int id;
}
