import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class GetPostDraftUseCase
    implements UseCase<Post, GetPostDraftParams> {
  GetPostDraftUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, Post>> call(GetPostDraftParams params) {
    final result = _postRepository.getPostDraft(
      draftType: params.draftType,
    );
    return result;
  }
}

class GetPostDraftParams {
  GetPostDraftParams(
    this.draftType,
  );
  final String draftType;
}
