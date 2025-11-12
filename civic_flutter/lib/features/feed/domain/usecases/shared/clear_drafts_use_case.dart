import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class ClearPostDraftsUseCase implements UseCase<void, String> {
  ClearPostDraftsUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(String draftType) async {
    return _feedRepository.clearDrafts(draftType: draftType);
  }
}
