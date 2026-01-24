import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:fpdart/fpdart.dart';

class DeletePostUseCase implements UseCase<void, DeletePostParams> {
  DeletePostUseCase({required FeedRepository feedRepository})
      : _feedRepository = feedRepository;
  final FeedRepository _feedRepository;

  @override
  Future<Either<Failure, void>> call(DeletePostParams params) async {
    final result = await _feedRepository.deletePost(
      postId: params.postId,
      fullDelete: params.fullDelete,
    );
    return result;
  }
}

class DeletePostParams {
  DeletePostParams(
    this.postId,
    this.fullDelete,
  );
  final int postId;
  final bool fullDelete;
}
