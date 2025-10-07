import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class GetPostCommentsUseCase
    implements UseCase<PostList, GetPostCommentsParams> {
  GetPostCommentsUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, PostList>> call(GetPostCommentsParams params) async {
    final result = await _feedRepository.getPostComments(
      postId: params.postId,
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetPostCommentsParams {
  GetPostCommentsParams(
    this.postId,
    this.page,
    this.limit,
  );
  final int postId;
  final int page;
  final int limit;
}
