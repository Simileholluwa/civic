import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';
import 'package:civic_client/civic_client.dart';

class GetCommentUseCase implements UseCase<Post, GetCommentParams> {
  GetCommentUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, Post>> call(GetCommentParams params) async {
    final result = await _postRepository.getComment(
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
