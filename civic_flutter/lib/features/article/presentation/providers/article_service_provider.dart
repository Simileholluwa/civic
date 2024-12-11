
import 'package:civic_flutter/features/article/article.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
part 'article_service_provider.g.dart';

@riverpod
ArticleLocalDatabaseImpl articleLocalDatabase(Ref ref) {
  return ArticleLocalDatabaseImpl(
    prefs: ref.read(localStorageProvider),
  );
}

@riverpod
ArticleRemoteDatasourceImpl articleRemoteDatasource(Ref ref) {
  return ArticleRemoteDatasourceImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
ArticleRepositoryImpl articleRepository(Ref ref) {
  return ArticleRepositoryImpl(
    remoteDatasource: ref.read(articleRemoteDatasourceProvider),
    localDatabase: ref.read(articleLocalDatabaseProvider),
  );
}

@riverpod
SaveArticleUseCase saveArticle(Ref ref) {
  return SaveArticleUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
DeleteArticleUseCase deleteArticle(Ref ref) {
  return DeleteArticleUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
GetArticleUseCase getArticle(Ref ref) {
  return GetArticleUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
GetArticlesUseCase getArticles(Ref ref) {
  return GetArticlesUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
DeleteDraftArticleUseCase deleteDraftArticle(Ref ref) {
  return DeleteDraftArticleUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
DeleteDraftArticlesUseCase deleteDraftArticles(Ref ref) {
  return DeleteDraftArticlesUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
SaveDraftArticleUseCase saveDraftArticle(Ref ref) {
  return SaveDraftArticleUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
RetrieveDraftArticlesUseCase retrieveDraftArticles(Ref ref) {
  return RetrieveDraftArticlesUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}