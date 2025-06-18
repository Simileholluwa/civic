import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class SavePostCommentUseCase implements UseCase<Post?, SavePostCommentParams> {
  SavePostCommentUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, Post?>> call(SavePostCommentParams params) async {
    final result = await _feedRepository.savePostComment(

      comment: params.comment,
      isReply: params.isReply,
    );
    return result;
  }
}

class SavePostCommentParams {
  SavePostCommentParams(
    this.comment,
    this.isReply,
  );
  final Post comment;
  final bool isReply;
}
