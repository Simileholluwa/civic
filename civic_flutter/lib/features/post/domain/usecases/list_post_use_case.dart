import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class ListPostUseCase implements UseCase<PostList, ListPostParams> {
  ListPostUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, PostList>> call(ListPostParams params) async {
    final result = await _postRepository.listPost(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class ListPostParams {
  ListPostParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
