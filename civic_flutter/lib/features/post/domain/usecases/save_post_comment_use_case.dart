import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class SavePostCommentUseCase implements UseCase<PostComment?, SavePostCommentParams> {
  SavePostCommentUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, PostComment?>> call(SavePostCommentParams params) async {
    final result = await _postRepository.savePostComment(
      postId: params.postId,
      comment: params.postComment,
    );
    return result;
  }
}

class SavePostCommentParams {
  SavePostCommentParams(
    this.postId,
    this.postComment,
  );
  final int postId;
  final PostComment postComment;
}
