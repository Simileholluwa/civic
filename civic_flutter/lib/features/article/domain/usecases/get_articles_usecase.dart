import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

class GetArticlesUseCase implements UseCase<ArticleList, GetArticlesParams> {
  GetArticlesUseCase({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository;
  final ArticleRepository _articleRepository;

  @override
  Future<Either<Failure, ArticleList>> call(GetArticlesParams params) async {
    final result = await _articleRepository.getArticles(
      page: params.page,
      limit: params.limit,
    );
    return result;
  }
}

class GetArticlesParams {
  GetArticlesParams(
    this.page,
    this.limit,
  );
  final int page;
  final int limit;
}
