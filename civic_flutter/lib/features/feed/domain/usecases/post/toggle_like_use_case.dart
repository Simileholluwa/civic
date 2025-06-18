import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class TogglePostLikeUseCase implements UseCase<void, TogglePostLikeParams> {
  TogglePostLikeUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(TogglePostLikeParams params) async {
    final result = await _feedRepository.toggleLike(
      id: params.id,
    );
    return result;
  }
}

class TogglePostLikeParams {
  TogglePostLikeParams(
    this.id,
  );
  final int id;
}
