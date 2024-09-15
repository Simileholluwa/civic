import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class SearchUsersToTagUseCase
    implements UseCase<List<UserRecord>, SearchUsersToTagParams> {
  SearchUsersToTagUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, List<UserRecord>>> call(
      SearchUsersToTagParams params) async {
    final result = await _postRepository.searchUsersToTag(
      query: params.query,
    );
    return result;
  }
}

class SearchUsersToTagParams {
  SearchUsersToTagParams(
    this.query,
  );
  final String query;
}
