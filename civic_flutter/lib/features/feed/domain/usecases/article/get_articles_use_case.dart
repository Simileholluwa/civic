import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class GetArticlesUseCase implements UseCase<PostList, GetArticlesParams> {
  GetArticlesUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, PostList>> call(GetArticlesParams params) async {
    final result = await _feedRepository.getArticles(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetArticlesParams {
  GetArticlesParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
