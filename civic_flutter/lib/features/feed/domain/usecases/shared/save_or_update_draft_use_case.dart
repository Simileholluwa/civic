import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class SaveOrUpdatePostDraftUseCase
    implements UseCase<void, SaveOrUpdatePostDraftParams> {
  SaveOrUpdatePostDraftUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(
    SaveOrUpdatePostDraftParams params,
  ) async {
    return _feedRepository.saveOrUpdateDraft(
      post: params.post,
      draftType: params.draftType,
    );
  }
}

class SaveOrUpdatePostDraftParams {
  SaveOrUpdatePostDraftParams({
    required this.post,
    required this.draftType,
  });

  final Post post;
  final String draftType;
}
