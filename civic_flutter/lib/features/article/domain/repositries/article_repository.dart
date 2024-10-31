import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:fpdart/fpdart.dart';

abstract class ArticleRepository {
  Future<Either<Failure, ArticleList>> getArticles({required int page, required int limit});
  Future<Either<Failure, Article>> getArticle({required int id});
  Future<Either<Failure, Article>> saveArticle({required Article article});
  Future<Either<Failure, void>> deleteArticle({required int id});
  Future<Either<Failure, void>> saveDraftArticle({required ArticleDraft articleDraft, required QuillController controller,});
  Either<Failure, List<ArticleDraft>?> retrieveDraftArticles();
  Future<Either<Failure, List<ArticleDraft>>> removeAllDraftArticles();
  Future<Either<Failure, void>> deleteDraftArticle({
    required ArticleDraft articleDraft,
    required QuillController controller,
  });
}