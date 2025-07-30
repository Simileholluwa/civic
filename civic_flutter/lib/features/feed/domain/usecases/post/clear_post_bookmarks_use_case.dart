import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class ClearPostBookmarksUseCase implements UseCase<void, NoParams> {
  ClearPostBookmarksUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    final result = await _feedRepository.clearPostBookmarks();
    return result;
  }
}
