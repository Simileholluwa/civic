import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/article/domain/repositries/article_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeleteDraftArticleUseCase
    implements UseCase<void, DeleteDraftArticleParams> {
  DeleteDraftArticleUseCase({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository;
  final ArticleRepository _articleRepository;

  @override
  Future<Either<Failure, void>> call(DeleteDraftArticleParams params) async {
    final result = await _articleRepository.deleteDraftArticle(
      articleDraft: params.articleDraft,
    );
    return result;
  }
}

class DeleteDraftArticleParams {
  DeleteDraftArticleParams(
    this.articleDraft,
  );
  final ArticleDraft articleDraft;
}
