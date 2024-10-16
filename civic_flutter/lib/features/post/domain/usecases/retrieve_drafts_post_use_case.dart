import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class RetrieveDraftPostUseCase
    implements NotFutureUseCase<List<DraftPost>?, NoParams> {
  RetrieveDraftPostUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Either<Failure, List<DraftPost>?> call(NoParams params) {
    final result = _postRepository.retrieveDrafts();
    return result;
  }
}
