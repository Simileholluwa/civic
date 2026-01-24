import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class RepostPostUseCase implements UseCase<Post, int> {
  RepostPostUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, Post>> call(int postId) async {
    final result = await _feedRepository.repostPost(
      postId: postId,
    );
    return result;
  }
}
