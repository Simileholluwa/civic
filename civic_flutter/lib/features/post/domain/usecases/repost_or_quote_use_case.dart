import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class RepostOrQuoteUseCase implements UseCase<Post, RepostOrQuoteParams> {
  RepostOrQuoteUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, Post>> call(RepostOrQuoteParams params) async {
    final result = await _postRepository.quoteProject(
      projectId: params.projectId,
      quoteContent: params.quoteContent,
    );
    return result;
  }
}

class RepostOrQuoteParams {
  RepostOrQuoteParams(
    this.projectId,
    this.quoteContent,
  );
  final int projectId;
  final Post quoteContent;
}
