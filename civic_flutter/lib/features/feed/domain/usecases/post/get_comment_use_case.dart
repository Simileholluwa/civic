import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class GetCommentUseCase implements UseCase<Post, GetCommentParams> {
  GetCommentUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, Post>> call(GetCommentParams params) async {
    final result = await _feedRepository.getComment(
      commentId: params.commentId,
      isComment: params.isComment,
    );
    return result;
  }
}

class GetCommentParams {
  GetCommentParams(
    this.commentId,
    this.isComment,
  );
  final int commentId;
  final bool isComment;
}
