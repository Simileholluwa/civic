import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/article/presentation/state/article_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_provider.g.dart';

@riverpod
class ArticleWriter extends _$ArticleWriter {
  @override
  ArticleState build(Article? article) {
    if (article != null && article.content.isNotEmpty) {
      final articleState = ArticleState(
        focusNode: FocusNode(),
        scrollController: ScrollController(),
        titleController: TextEditingController(text: article.title),
        controller: QuillController(
          document: Document.fromJson(
            jsonDecode(article.content),
          ),
          selection: const TextSelection.collapsed(offset: 0),
        ),
        isEmptyContent: true,
        title: article.title,
        content: article.content,
        banner: article.banner,
      );
      articleState.controller!.addListener(() {
        setContent(
          jsonEncode(
            state.controller!.document.toDelta().toJson(),
          ),
        );
        setIsEmptyContent(state.controller!.document.isEmpty());
      });
      return articleState;
    }
    final articleState = ArticleState(
      focusNode: FocusNode(),
      scrollController: ScrollController(),
      titleController: TextEditingController(),
      controller: QuillController.basic(),
      isEmptyContent: true,
    );
    articleState.controller!.addListener(() {
      setContent(
        jsonEncode(
          state.controller!.document.toDelta().toJson(),
        ),
      );
      setIsEmptyContent(state.controller!.document.isEmpty());
    });
    return articleState;
  }

  void setBannerImage(String image) {
    state = state.copyWith(banner: image);
  }

  void setIsEmptyContent(bool isEmpty) {
    state = state.copyWith(isEmptyContent: isEmpty);
  }

  void setDraftContent(ArticleDraft articleDraft) {
    state = state.copyWith(
      title: articleDraft.title,
      content: articleDraft.content,
      banner: articleDraft.banner,
    );
    state.controller!.document = Document.fromJson(
      jsonDecode(articleDraft.content),
    );
    state.titleController!.text = articleDraft.title;
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setContent(String content) {
    state = state.copyWith(
      content: content,
      contentPlainText: state.controller!.document.toPlainText(),
    );
  }

  void setEditorDocument(Document document) {
    state.controller!.document = Document.fromJson(
      jsonDecode(state.content),
    );
  }

  void clearBannerImage() {
    state = state.copyWith(banner: '');
  }
}
