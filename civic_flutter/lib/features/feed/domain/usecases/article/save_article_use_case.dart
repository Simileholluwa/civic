import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class SaveArticleUseCase implements UseCase<Post?, SaveArticleParams> {
  SaveArticleUseCase({
    required FeedRepository feedRepository,
  }) : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, Post?>> call(SaveArticleParams params) async {
    final result = await _feedRepository.savePoll(
      post: params.post,
    );
    return result;
  }
}

class SaveArticleParams {
  SaveArticleParams(
    this.post,
  );
  final Post post;
}
