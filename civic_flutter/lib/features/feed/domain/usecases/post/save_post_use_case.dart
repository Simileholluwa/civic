import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class SavePostUseCase implements UseCase<Post?, SavePostParams> {
  SavePostUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, Post?>> call(SavePostParams params) async {
    final result = await _feedRepository.savePost(
      post: params.post,
    );
    return result;
  }
}

class SavePostParams {
  SavePostParams(
    this.post,
  );
  final Post post;
}
