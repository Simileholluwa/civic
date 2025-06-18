import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class SavePostDraftUseCase implements UseCase<void, SavePostDraftParams> {
  SavePostDraftUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(SavePostDraftParams params) async {
    final result = await _feedRepository.saveDraft(
      post: params.post,
      draftType: params.draftType,
    );
    return result;
  }
}

class SavePostDraftParams {
  SavePostDraftParams(
    this.post,
    this.draftType,
  );
  final Post post;
  final String draftType;
}
