import 'dart:convert';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_client/civic_client.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_provider.g.dart';

@riverpod
class ArticleWriter extends _$ArticleWriter {
  void setBannerImage(String image) {
    state = state.copyWith(banner: image);
  }

  void setIsEmptyContent(bool isEmpty) {
    state = state.copyWith(isEmptyContent: isEmpty);
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setContent(String content) {
    state = state.copyWith(
      content: content,
      contentPlainText: state.controller.document.toPlainText(),
    );
  }

  void clearBannerImage() {
    state = state.copyWith(banner: '');
  }

  @override
  ArticleState build(Article? article) {
    if (article != null && article.content != null) {
      final articleState = ArticleState.populate(article);
      articleState.controller.addListener(() {
        setContent(
          jsonEncode(
            state.controller.document.toDelta().toJson(),
          ),
        );
        setIsEmptyContent(state.controller.document.isEmpty());
      });
      return articleState;
    }
    final articleState = ArticleState.empty();
    articleState.controller.addListener(() {
      setContent(
        jsonEncode(
          state.controller.document.toDelta().toJson(),
        ),
      );
      setIsEmptyContent(state.controller.document.isEmpty());
    });
    return articleState;
  }
}
