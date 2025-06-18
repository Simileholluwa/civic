import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class GetPollsUseCase implements UseCase<PostList, GetPollsParams> {
  GetPollsUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, PostList>> call(GetPollsParams params) async {
    final result = await _feedRepository.getPolls(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetPollsParams {
  GetPollsParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
