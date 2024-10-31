// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency

import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_draft_provider.g.dart';

@riverpod
class ArticleDrafts extends _$ArticleDrafts {
  @override
  List<ArticleDraft> build() {
    final retrieveDraftArticle = ref.read(retrieveDraftArticlesProvider);
    final result = retrieveDraftArticle(
      NoParams(),
    );

    return result.fold(
      (error) => <ArticleDraft>[],
      (articleDraft) {
        if (articleDraft == null) {
          return state = <ArticleDraft>[];
        } else {
          log(articleDraft.toString());
          return state = articleDraft;
        }
      },
    );
  }

  Future<bool> deleteAllDrafts() async {
    final deleteAll = ref.read(deleteDraftArticlesProvider);
    final result = await deleteAll(
      NoParams(),
    );
    return result.fold(
      (error) {
        TToastMessages.errorToast(
          error.message,
        );
        return false;
      },
      (r) {
        state = <ArticleDraft>[];
        return true;
      },
    );
  }

  Future<bool> saveArticleDraft(ArticleDraft articleDraft, QuillController controller,) async {
    final saveDraft = ref.read(saveDraftArticleProvider);
    final result = await saveDraft(
      SaveDraftArticleParams(
        articleDraft,
        controller,
      ),
    );

    return result.fold((error) {
      TToastMessages.errorToast(
        error.message,
      );
      return false;
    }, (r) {
      return true;
    });
  }

  Future<bool> deleteDraftArticle(
    ArticleDraft articleDraft,
    QuillController controller,
    int index,
  ) async {
    final deleteDraft = ref.read(deleteDraftArticleProvider);
    final result = await deleteDraft(
      DeleteDraftArticleParams(
        articleDraft,
        controller,
      ),
    );

    return result.fold((error) {
      TToastMessages.errorToast(
        error.message,
      );
      return false;
    }, (r) {
      var drafts = state;
      drafts.removeAt(index);

      state = [...drafts];
      return true;
    });
  }

  Future<void> sendDraftPost(
    ArticleDraft articleDraft,
    QuillController controller,
    int index,
  ) async {
    final result = await ref.read(sendArticleProvider.notifier).sendArticle(
          banner: articleDraft.banner,
          content: articleDraft.content,
          title: articleDraft.title,
        );

    if (result) {
      await deleteDraftArticle(
        articleDraft,
        controller,
        index,
      );
    }
  }
}
