import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class MarkPostNotInterestedUseCase implements UseCase<void, MarkPostNotInterestedParams> {
  MarkPostNotInterestedUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(MarkPostNotInterestedParams params) async {
    final result = await _feedRepository.markNotInterested(
      id: params.id,
      reason: params.reason,
    );
    return result;
  }
}

class MarkPostNotInterestedParams {
  MarkPostNotInterestedParams(
    this.id,
    this.reason,
  );
  final int id;
  final String reason;
}
