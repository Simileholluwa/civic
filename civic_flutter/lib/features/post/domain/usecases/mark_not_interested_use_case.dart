import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class MarkPostNotInterestedUseCase implements UseCase<void, MarkPostNotInterestedParams> {
  MarkPostNotInterestedUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(MarkPostNotInterestedParams params) async {
    final result = await _postRepository.toggleBookmark(
      id: params.id,
    );
    return result;
  }
}

class MarkPostNotInterestedParams {
  MarkPostNotInterestedParams(
    this.id,
  );
  final int id;
}
