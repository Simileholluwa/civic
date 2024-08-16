import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class SavePostUseCase implements UseCase<Post?, SavePostParams> {
  SavePostUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, Post?>> call(SavePostParams params) async {
    final result = await _postRepository.save(
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
