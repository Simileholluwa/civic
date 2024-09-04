import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class PostRepository {
  Future<Either<Failure, Post?>> save({required Post post});
  Future<Either<Failure, void>> saveDraft({required DraftPost draftPost});
  Future<Either<Failure, PostList>> listPost({
    required int page,
    required int limit,
  });
  Either<Failure, List<DraftPost>?> retrieveDrafts();
  Future<Either<String, Post?>> retrieve({required int id});
  Future<Either<Failure, List<DraftPost>>> removeAllDraftPost();
  Future<Either<Failure, void>> deleteDraftPost({
    required DraftPost draftPost,
  });
}
