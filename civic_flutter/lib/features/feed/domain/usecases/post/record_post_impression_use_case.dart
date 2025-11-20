import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class RecordPostImpressionUseCase
    implements UseCase<void, RecordPostImpressionParams> {
  RecordPostImpressionUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(
    RecordPostImpressionParams params,
  ) async {
    try {
      _feedRepository.recordImpression(
        postId: params.postId,
        source: params.source,
      );
      return const Right(null);
    } on Exception catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}

class RecordPostImpressionParams {
  RecordPostImpressionParams({required this.postId, this.source});
  final int postId;
  final String? source;
}
