import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:fpdart/fpdart.dart';

class TogglePollBookmarkUseCase implements UseCase<void, TogglePollBookmarkParams> {
  TogglePollBookmarkUseCase({required PollRepository pollRepository})
      : _pollRepository = pollRepository;
  final PollRepository _pollRepository;

  @override
  Future<Either<Failure, void>> call(TogglePollBookmarkParams params) async {
    final result = await _pollRepository.toggleBookmark(
      id: params.id,
    );
    return result;
  }
}

class TogglePollBookmarkParams {
  TogglePollBookmarkParams(
    this.id,
  );
  final int id;
}
