import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class QuotePostUseCase implements UseCase<Post, QuotePostParams> {
  QuotePostUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, Post>> call(QuotePostParams params) async {
    final result = await _feedRepository.quotePost(
      postId: params.postId,
      quoteContent: params.quoteContent,
    );
    return result;
  }
}

class QuotePostParams {
  QuotePostParams(this.postId, this.quoteContent);
  final int postId;
  final Post quoteContent;
}
