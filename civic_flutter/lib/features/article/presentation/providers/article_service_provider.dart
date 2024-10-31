import 'package:civic_flutter/core/local_storage/storage_utility.dart';
import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/features/article/data/datasources/local_datasource/article_local_datasource.dart';
import 'package:civic_flutter/features/article/data/datasources/remote_datasourece/article_remote_datasource.dart';
import 'package:civic_flutter/features/article/data/repositories/article_repository_impl.dart';
import 'package:civic_flutter/features/article/domain/usecases/delete_article_usecase.dart';
import 'package:civic_flutter/features/article/domain/usecases/delete_draft_article_use_case.dart';
import 'package:civic_flutter/features/article/domain/usecases/delete_draft_articles_use_case.dart';
import 'package:civic_flutter/features/article/domain/usecases/get_article_usecase.dart';
import 'package:civic_flutter/features/article/domain/usecases/get_articles_usecase.dart';
import 'package:civic_flutter/features/article/domain/usecases/retrieve_draft_articles_use_case.dart';
import 'package:civic_flutter/features/article/domain/usecases/save_article_usecase.dart';
import 'package:civic_flutter/features/article/domain/usecases/save_draft_article_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_service_provider.g.dart';

@riverpod
ArticleLocalDatabaseImpl articleLocalDatabase(ArticleLocalDatabaseRef ref) {
  return ArticleLocalDatabaseImpl(
    prefs: AppLocalStorage.to,
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