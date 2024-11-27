import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:fpdart/fpdart.dart';

class SaveArticleUseCase implements UseCase<Article?, SaveArticleParams> {
  SaveArticleUseCase({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository;
  final ArticleRepository _articleRepository;

  @override
  Future<Either<Failure, Article?>> call(SaveArticleParams params) async {
    final result = await _articleRepository.saveArticle(
      article: params.article,
    );
    return result;
  }
}

class SaveArticleParams {
  SaveArticleParams(
    this.article,
  );
  final Article article;
}
