import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/exceptions.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/features/article/data/remote_datasource/article_remote_datasource.dart';
import 'package:civic_flutter/features/article/domain/repositries/article_repository.dart';
import 'package:fpdart/fpdart.dart';

class ArticleRepositoryImpl extends ArticleRepository {
  ArticleRepositoryImpl({
    required ArticleRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;
  final ArticleRemoteDatasource _remoteDatasource;
  @override
  Future<Either<Failure, void>> deleteArticle({required int id}) async {
    try {
      final result = await _remoteDatasource.deleteArticle(id: id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Article>> getArticle({required int id}) async {
    try {
      final result = await _remoteDatasource.getArticle(id: id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ArticleList>> getArticles({required int page, required int limit,}) async {
    try {
      final result = await _remoteDatasource.getArticles(
        page: page,
        limit: limit,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Article>> saveArticle(
      {required Article article}) async {
    try {
      final result = await _remoteDatasource.saveArticle(article: article);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }
}
