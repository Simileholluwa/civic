import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class MarkPostNotInterestedUseCase implements UseCase<void, MarkPostNotInterestedParams> {
  MarkPostNotInterestedUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(MarkPostNotInterestedParams params) async {
    final result = await _postRepository.markNotInterested(
      id: params.id,
      reason: params.reason,
    );
    return result;
  }
}

class MarkPostNotInterestedParams {
  MarkPostNotInterestedParams(
    this.id,
    this.reason,
  );
  final int id;
  final String reason;
}
