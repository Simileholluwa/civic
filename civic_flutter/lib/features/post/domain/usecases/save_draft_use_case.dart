import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class SaveDraftUseCase implements UseCase<void, SaveDraftParams> {
  SaveDraftUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(SaveDraftParams params) async {
    final result = await _postRepository.saveDraft(
      draftPost: params.draftPost,
    );
    return result;
  }
}

class SaveDraftParams {
  SaveDraftParams(
    this.draftPost,
  );
  final DraftPost draftPost;
}
