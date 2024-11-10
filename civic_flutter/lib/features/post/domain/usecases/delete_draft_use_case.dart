import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteDraftUseCase implements UseCase<void, DeleteDraftPostParams> {
  DeleteDraftUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(DeleteDraftPostParams params) async {
    final result = await _postRepository.deleteDraft(
      draftPost: params.draftPost,
    );
    return result;
  }
}

class DeleteDraftPostParams {
  DeleteDraftPostParams(
    this.draftPost,
  );
  final DraftPost draftPost;
}
