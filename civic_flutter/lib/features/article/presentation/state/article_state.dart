import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class ArticleState {
  final String banner;
  final String title;
  final String content;
  final String contentPlainText;
  final FocusNode? focusNode;
  final ScrollController? scrollController;
  final TextEditingController? titleController;
  final QuillController? controller;
  final bool isEmptyContent;
  ArticleState({
    this.focusNode, 
    this.scrollController, 
    this.titleController, 
    this.controller,
    this.banner = '',
    this.title = '',
    this.content = '',
    this.contentPlainText = '',
    this.isEmptyContent = true,
  });

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