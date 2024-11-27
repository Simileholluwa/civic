
import 'package:civic_flutter/features/article/article.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:civic_flutter/core/core.dart';
part 'article_service_provider.g.dart';

@riverpod
ArticleLocalDatabaseImpl articleLocalDatabase(ArticleLocalDatabaseRef ref) {
  return ArticleLocalDatabaseImpl(
    prefs: ref.read(localStorageProvider),
  );
}

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
    localDatabase: ref.read(articleLocalDatabaseProvider),
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

@riverpod
DeleteDraftArticleUseCase deleteDraftArticle(DeleteDraftArticleRef ref) {
  return DeleteDraftArticleUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
DeleteDraftArticlesUseCase deleteDraftArticles(DeleteDraftArticlesRef ref) {
  return DeleteDraftArticlesUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
SaveDraftArticleUseCase saveDraftArticle(SaveDraftArticleRef ref) {
  return SaveDraftArticleUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}

@riverpod
RetrieveDraftArticlesUseCase retrieveDraftArticles(RetrieveDraftArticlesRef ref) {
  return RetrieveDraftArticlesUseCase(
    articleRepository: ref.read(articleRepositoryProvider),
  );
}