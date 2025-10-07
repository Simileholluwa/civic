import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class GetPostCommentRepliesUseCase
    implements UseCase<PostList, GetPostCommentRepliesParams> {
  GetPostCommentRepliesUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, PostList>> call(
    GetPostCommentRepliesParams params,
  ) async {
    final result = await _feedRepository.getPostCommentReplies(
      commentId: params.commentId,
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetPostCommentRepliesParams {
  GetPostCommentRepliesParams(
    this.commentId,
    this.page,
    this.limit,
  );
  final int commentId;
  final int page;
  final int limit;
}
