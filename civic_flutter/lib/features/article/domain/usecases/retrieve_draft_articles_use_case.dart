import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/article/domain/repositries/article_repository.dart';
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
