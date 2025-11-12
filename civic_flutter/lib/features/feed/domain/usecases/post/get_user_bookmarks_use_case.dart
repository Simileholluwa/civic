import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class GetUserBookmarksUseCase
    implements UseCase<PostList, GetUserPostBookmarksParams> {
  GetUserBookmarksUseCase({
    required FeedRepository feedRepository,
  }) : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, PostList>> call(
    GetUserPostBookmarksParams params,
  ) async {
    final result = await _feedRepository.getUserPostBookmarks(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetUserPostBookmarksParams {
  GetUserPostBookmarksParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
