import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class DeletePostDraftUseCase implements UseCase<void, DeletePostDraftParams> {
  DeletePostDraftUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(DeletePostDraftParams params) async {
    final result = await _postRepository.deletePostDraft(
      draftType: params.draftType,
    );
    return result;
  }
}

class DeletePostDraftParams {
  DeletePostDraftParams(
    this.draftType,
  );
  final String draftType;
}
