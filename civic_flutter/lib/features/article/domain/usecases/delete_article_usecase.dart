import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

class DeleteArticleUseCase implements UseCase<void, DeleteArticleParams> {
  DeleteArticleUseCase({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository;
  final ArticleRepository _articleRepository;

  @override
  Future<Either<Failure, void>> call(DeleteArticleParams params) async {
    final result = await _articleRepository.deleteArticle(
      id: params.id,
    );
    return result;
  }
}

class DeleteArticleParams {
  DeleteArticleParams(
    this.id,
  );
  final int id;
}
