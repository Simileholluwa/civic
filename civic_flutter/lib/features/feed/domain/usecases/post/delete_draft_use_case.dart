import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class DeletePostDraftUseCase implements UseCase<void, DeletePostDraftParams> {
  DeletePostDraftUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(DeletePostDraftParams params) async {
    final result = await _feedRepository.deleteDraft(
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
