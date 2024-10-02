import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_text_controller.g.dart';

@riverpod
class PostText extends _$PostText {
  @override
  Raw<TextEditingController> build() {
    final controller = TextEditingController();
    controller.addListener(() {
      getLength();
      ref.notifyListeners();
    });
    return controller;
  }

  void setText(String text) {
    state.text = text;
    ref.notifyListeners();
  }

  int getLength() {
    return state.text.length;
  }

  void reset() {
    state.clear();
  }
}
