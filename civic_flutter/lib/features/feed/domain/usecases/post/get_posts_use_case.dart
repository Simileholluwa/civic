import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class GetPostsUseCase implements UseCase<PostList, GetPostsParams> {
  GetPostsUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, PostList>> call(GetPostsParams params) async {
    final result = await _feedRepository.getPosts(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetPostsParams {
  GetPostsParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
