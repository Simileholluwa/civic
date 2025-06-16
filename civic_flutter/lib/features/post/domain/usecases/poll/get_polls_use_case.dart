import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class GetPollsUseCase implements UseCase<PostList, GetPollsParams> {
  GetPollsUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, PostList>> call(GetPollsParams params) async {
    final result = await _postRepository.getPolls(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetPollsParams {
  GetPollsParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
