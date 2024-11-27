import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:fpdart/fpdart.dart';

class DeleteDraftArticlesUseCase implements UseCase<List<ArticleDraft>, NoParams> {
  DeleteDraftArticlesUseCase({
    required ArticleRepository articleRepository,
  }) : _articleRepository = articleRepository;
  final ArticleRepository _articleRepository;

  @override
  Future<Either<Failure, List<ArticleDraft>>> call(NoParams params) async {
    final result = await _articleRepository.removeAllDraftArticles();
    return result;
  }
}
