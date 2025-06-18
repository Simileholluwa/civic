import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class RepostOrQuoteUseCase implements UseCase<Post, RepostOrQuoteParams> {
  RepostOrQuoteUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, Post>> call(RepostOrQuoteParams params) async {
    final result = await _feedRepository.quoteProject(
      projectId: params.projectId,
      quoteContent: params.quoteContent,
    );
    return result;
  }
}

class RepostOrQuoteParams {
  RepostOrQuoteParams(
    this.projectId,
    this.quoteContent,
  );
  final int projectId;
  final Post quoteContent;
}
