import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

class RetrieveDraftArticlesUseCase
    implements NotFutureUseCase<List<ArticleDraft>?, NoParams> {
  RetrieveDraftArticlesUseCase({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository;
  final ArticleRepository _articleRepository;

  @override
  Either<Failure, List<ArticleDraft>?> call(NoParams params) {
    final result = _articleRepository.retrieveDraftArticles();
    return result;
  }
}
