import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class SubscribeToNotifUseCase implements UseCase<void, SubscribeToNotifParams> {
  SubscribeToNotifUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(SubscribeToNotifParams params) async {
    final result = await _feedRepository.subscribeToNotifications(
      postId: params.postId,
    );
    return result;
  }
}

class SubscribeToNotifParams {
  SubscribeToNotifParams(
    this.postId,
  );
  final int postId;
}
