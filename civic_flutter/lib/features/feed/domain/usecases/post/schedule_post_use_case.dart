import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class SchedulePostUseCase implements UseCase<void, SchedulePostParams> {
  SchedulePostUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(SchedulePostParams params) async {
    final result = await _feedRepository.schedulePost(
      post: params.post,
      dateTime: params.dateTime,
    );
    return result;
  }
}

class SchedulePostParams {
  SchedulePostParams(
    this.post,
    this.dateTime,
  );
  final Post post;
  final DateTime dateTime;
}
