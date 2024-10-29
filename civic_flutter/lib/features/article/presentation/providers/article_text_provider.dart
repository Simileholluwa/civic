import 'package:civic_flutter/core/services/article_text_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'article_text_provider.g.dart';

@Riverpod(keepAlive: true)
class ArticleText extends _$ArticleText {
  @override
  Raw<ArticleTextEditingController> build() {
    
    final controller = ArticleTextEditingController();
    controller.addListener(() {
      ref.notifyListeners();
    });
    return controller;
  }

  void setText(String text) {
    state.text = text;
    ref.notifyListeners();
  }

  void reset() {
    state.clear();
  }
}
