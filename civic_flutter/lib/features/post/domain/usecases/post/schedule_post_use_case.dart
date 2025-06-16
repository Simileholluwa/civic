import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class SchedulePostUseCase implements UseCase<void, SchedulePostParams> {
  SchedulePostUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(SchedulePostParams params) async {
    final result = await _postRepository.schedulePost(
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
