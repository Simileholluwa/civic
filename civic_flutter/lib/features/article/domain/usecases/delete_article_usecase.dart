import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/article/domain/repositries/article_repository.dart';
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
