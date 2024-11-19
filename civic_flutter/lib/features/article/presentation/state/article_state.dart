import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ArticleState {
  ArticleState({
    required this.focusNode,
    required this.scrollController,
    required this.titleController,
    required this.controller,
    this.banner = '',
    this.title = '',
    this.content = '',
    this.contentPlainText = '',
    this.isEmptyContent = true,
  });

  factory ArticleState.empty() {
    return ArticleState(
      focusNode: FocusNode(),
      scrollController: ScrollController(),
      titleController: TextEditingController(),
      controller: QuillController.basic(),
    );
  }

  factory ArticleState.populate(Article article) {
    return ArticleState(
      focusNode: FocusNode(),
      scrollController: ScrollController(),
      titleController: TextEditingController(text: article.title),
      controller: QuillController(
        document: Document.fromJson(
          jsonDecode(article.content ?? '{}'),
        ),
        selection: const TextSelection.collapsed(offset: 0),
      ),
      isEmptyContent: true,
      title: article.title ?? '',
      content: article.content ?? '',
      banner: article.banner ?? '',
    );
  }

  final String banner;
  final String content;
  final String contentPlainText;
  final QuillController controller;
  final FocusNode focusNode;
  final bool isEmptyContent;
  final ScrollController scrollController;
  final String title;
  final TextEditingController titleController;

  ArticleState copyWith({
    String? banner,
    String? title,
    String? content,
    FocusNode? focusNode,
    ScrollController? scrollController,
    TextEditingController? titleController,
    QuillController? controller,
    String? contentPlainText,
    bool? isEmptyContent,
  }) {
    return ArticleState(
      banner: banner ?? this.banner,
      title: title ?? this.title,
      content: content ?? this.content,
      focusNode: focusNode ?? this.focusNode,
      scrollController: scrollController ?? this.scrollController,
      titleController: titleController ?? this.titleController,
      controller: controller ?? this.controller,
      contentPlainText: contentPlainText ?? this.contentPlainText,
      isEmptyContent: isEmptyContent ?? this.isEmptyContent,
    );
  }
}
