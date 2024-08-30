import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class RetrievePostUseCase implements StringUseCase<Post?, RetrievePostParams> {
  RetrievePostUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<String, Post?>> call(RetrievePostParams params) async {
    final result = await _postRepository.retrieve(
      id: params.id,
    );
    return result;
  }
}

class RetrievePostParams {
  RetrievePostParams(
    this.id,
  );
  final int id;
}
