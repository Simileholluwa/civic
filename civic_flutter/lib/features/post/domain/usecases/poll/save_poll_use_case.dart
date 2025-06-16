import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class SavePollUseCase implements UseCase<Post?, SavePollParams> {
  SavePollUseCase({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, Post?>> call(SavePollParams params) async {
    final result = await _postRepository.savePoll(
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
