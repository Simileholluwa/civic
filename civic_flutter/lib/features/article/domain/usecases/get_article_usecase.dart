import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

class GetArticleUseCase implements UseCase<Article?, GetArticleParams> {
  GetArticleUseCase({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository;
  final ArticleRepository _articleRepository;

  @override
  Future<Either<Failure, Article?>> call(GetArticleParams params) async {
    final result = await _articleRepository.getArticle(
      id: params.id,
    );
    return result;
  }
}

class GetArticleParams {
  GetArticleParams(
    this.id,
  );
  final int id;
}
