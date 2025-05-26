import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class TogglePostBookmarkUseCase implements UseCase<void, TogglePostBookmarkParams> {
  TogglePostBookmarkUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(TogglePostBookmarkParams params) async {
    final result = await _postRepository.toggleBookmark(
      id: params.id,
    );
    return result;
  }
}

class TogglePostBookmarkParams {
  TogglePostBookmarkParams(
    this.id,
  );
  final int id;
}
