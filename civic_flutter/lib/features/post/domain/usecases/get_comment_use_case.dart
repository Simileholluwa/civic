import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class GetCommentUseCase implements UseCase<void, GetCommentParams> {
  GetCommentUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(GetCommentParams params) async {
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
