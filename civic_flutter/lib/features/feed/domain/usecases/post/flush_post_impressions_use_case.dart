import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class FlushPostImpressionsUseCase
    implements UseCase<void, FlushPostImpressionsParams> {
  FlushPostImpressionsUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(
    FlushPostImpressionsParams params,
  ) async {
    return _feedRepository.flushImpressions(source: params.source);
  }
}

class FlushPostImpressionsParams {
  FlushPostImpressionsParams({this.source});
  final String? source;
}
