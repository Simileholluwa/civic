import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:fpdart/fpdart.dart';

class SaveDraftArticleUseCase implements UseCase<void, SaveDraftArticleParams> {
  SaveDraftArticleUseCase({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository;
  final ArticleRepository _articleRepository;

  @override
  Future<Either<Failure, void>> call(SaveDraftArticleParams params) async {
    final result = await _articleRepository.saveDraftArticle(
      articleDraft: params.articleDraft,
    );
    return result;
  }
}

class SaveDraftArticleParams {
  SaveDraftArticleParams(
    this.articleDraft,
  );
  final ArticleDraft articleDraft;
}
