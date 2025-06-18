import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class SavePollUseCase implements UseCase<Post?, SavePollParams> {
  SavePollUseCase({
    required FeedRepository feedRepository,
  }) : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, Post?>> call(SavePollParams params) async {
    final result = await _feedRepository.savePoll(
      post: params.post,
    );
    return result;
  }
}

class SavePollParams {
  SavePollParams(
    this.post,
  );
  final Post post;
}
