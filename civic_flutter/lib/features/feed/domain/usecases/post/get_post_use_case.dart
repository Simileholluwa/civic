import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class GetPostUseCase implements UseCase<PostWithUserState, GetPostParams> {
  GetPostUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, PostWithUserState>> call(GetPostParams params) async {
    final result = await _feedRepository.getPost(
      postId: params.postId,
    );
    return result;
  }
}

class GetPostParams {
  GetPostParams(
    this.postId,
  );
  final int postId;
}
