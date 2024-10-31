import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/errors/failure.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/article/domain/repositries/article_repository.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:fpdart/fpdart.dart';

class SaveDraftArticleUseCase implements UseCase<void, SaveDraftArticleParams> {
  SaveDraftArticleUseCase({required ArticleRepository articleRepository})
      : _articleRepository = articleRepository;
  final ArticleRepository _articleRepository;

  @override
  Future<Either<Failure, void>> call(SaveDraftArticleParams params) async {
    final result = await _articleRepository.saveDraftArticle(
      articleDraft: params.articleDraft,
      controller: params.controller,
    );
    return result;
  }
}

class SaveDraftArticleParams {
  SaveDraftArticleParams(
    this.articleDraft,
    this.controller,
  );
  final ArticleDraft articleDraft;
  final QuillController controller;
}
