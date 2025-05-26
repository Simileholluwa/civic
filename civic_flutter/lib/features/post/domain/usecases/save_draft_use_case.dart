import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class SavePostDraftUseCase implements UseCase<void, SavePostDraftParams> {
  SavePostDraftUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(SavePostDraftParams params) async {
    final result = await _postRepository.savePostDraft(
      post: params.post,
    );
    return result;
  }
}

class SavePostDraftParams {
  SavePostDraftParams(
    this.post,
  );
  final Post post;
}
