import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/features/article/data/remote_datasource/article_remote_datasource.dart';
import 'package:civic_flutter/features/article/data/repositories/article_repository_impl.dart';
import 'package:civic_flutter/features/article/domain/usecases/delete_article_usecase.dart';
import 'package:civic_flutter/features/article/domain/usecases/get_article_usecase.dart';
import 'package:civic_flutter/features/article/domain/usecases/get_articles_usecase.dart';
import 'package:civic_flutter/features/article/domain/usecases/save_article_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_service_provider.g.dart';

@riverpod
ArticleRemoteDatasourceImpl articleRemoteDatasource(ArticleRemoteDatasourceRef ref) {
  return ArticleRemoteDatasourceImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
ArticleRepositoryImpl articleRepository(ArticleRepositoryRef ref) {
  return ArticleRepositoryImpl(
    remoteDatasource: ref.read(articleRemoteDatasourceProvider),
  );
}

@riverpod
SaveArticleUseCase saveArticle(SaveArticleRef ref) {
  return SaveArticleUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
DeleteArticleUseCase deleteArticle(DeleteArticleRef ref) {
  return DeleteArticleUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
GetArticleUseCase getArticle(GetArticleRef ref) {
  return GetArticleUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
GetArticlesUseCase getArticles(GetArticlesRef ref) {
  return GetArticlesUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}