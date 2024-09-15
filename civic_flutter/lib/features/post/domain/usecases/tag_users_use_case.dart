import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class TagUsersUseCase implements UseCase<List<UserRecord>, NoParams> {
  TagUsersUseCase({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, List<UserRecord>>> call(NoParams params) async {
    final result = await _postRepository.tagUsers();
    return result;
  }
}
