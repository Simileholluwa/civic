import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class DeletePostDraftByIdUseCase
    implements UseCase<void, DeletePostDraftByIdParams> {
  DeletePostDraftByIdUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(
    DeletePostDraftByIdParams params,
  ) async {
    return _feedRepository.deleteDraftById(
      draftType: params.draftType,
      draftId: params.draftId,
    );
  }
}

class DeletePostDraftByIdParams {
  DeletePostDraftByIdParams({
    required this.draftType,
    required this.draftId,
  });

  final String draftType;
  final int draftId;
}
