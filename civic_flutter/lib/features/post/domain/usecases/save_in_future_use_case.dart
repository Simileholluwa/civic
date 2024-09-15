import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class SaveInFutureUseCase implements UseCase<void, SaveInFutureParams> {
  SaveInFutureUseCase({required PostRepository postRepository})
      : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, void>> call(SaveInFutureParams params) async {
    final result = await _postRepository.saveInFuture(
      post: params.post,
      dateTime: params.dateTime,
    );
    return result;
  }
}

class SaveInFutureParams {
  SaveInFutureParams(
    this.post,
    this.dateTime,
  );
  final Post post;
  final DateTime dateTime;
}
