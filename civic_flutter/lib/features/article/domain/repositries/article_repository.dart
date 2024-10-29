import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class ArticleRepository {
  Future<Either<Failure, ArticleList>> getArticles({required int page, required int limit});
  Future<Either<Failure, Article>> getArticle({required int id});
  Future<Either<Failure, Article>> saveArticle({required Article article});
  Future<Either<Failure, void>> deleteArticle({required int id});
}