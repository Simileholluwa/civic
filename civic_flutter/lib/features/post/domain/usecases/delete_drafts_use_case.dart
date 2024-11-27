import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:fpdart/fpdart.dart';

class DeleteDraftsUseCase implements UseCase<List<DraftPost>, NoParams> {
  DeleteDraftsUseCase({
    required PostRepository postRepository,
  }) : _postRepository = postRepository;
  final PostRepository _postRepository;

  @override
  Future<Either<Failure, List<DraftPost>>> call(NoParams params) async {
    final result = await _postRepository.deleteDrafts();
    return result;
  }
}
