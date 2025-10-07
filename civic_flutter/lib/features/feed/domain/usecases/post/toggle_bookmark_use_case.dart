import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class TogglePostBookmarkUseCase
    implements UseCase<void, TogglePostBookmarkParams> {
  TogglePostBookmarkUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(TogglePostBookmarkParams params) async {
    final result = await _feedRepository.toggleBookmark(
      id: params.id,
    );
    return result;
  }
}

class TogglePostBookmarkParams {
  TogglePostBookmarkParams(
    this.id,
  );
  final int id;
}
