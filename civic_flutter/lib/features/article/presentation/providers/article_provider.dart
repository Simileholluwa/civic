import 'package:civic_flutter/features/article/presentation/state/article_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_provider.g.dart';

@riverpod
class ArticleWriter extends _$ArticleWriter {
  @override
  ArticleState build() {
    final articleState = ArticleState(
      focusNode: FocusNode(),
      scrollController: ScrollController(),
      titleController: TextEditingController(text: ''),
      controller: QuillController.basic(),
      canSend: false,
    );
    articleState.controller!.document.changes.listen((event) {
      if (event.source == ChangeSource.local) {
        setContent();
        sendStatus();
      }
    });
    return articleState;
  }

  void setBannerImage(String image) {
    state = state.copyWith(banner: image);
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setContent() {
    state = state.copyWith(
      content: state.controller!.document.toDelta().toJson().toString(),
      contentPlainText: state.controller!.document.toPlainText(),
    );
  }

  void sendStatus() {
    state.copyWith(
      canSend: state.banner.isNotEmpty &&
          state.contentPlainText.isNotEmpty &&
          state.title.isNotEmpty,
    );
  }

  void clearBannerImage() {
    state = state.copyWith(banner: '');
  }
}
