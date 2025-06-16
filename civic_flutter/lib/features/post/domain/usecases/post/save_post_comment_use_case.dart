import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class SavePostCommentUseCase implements UseCase<Post?, SavePostCommentParams> {
  SavePostCommentUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, Post?>> call(SavePostCommentParams params) async {
    final result = await _postRepository.savePostComment(

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
