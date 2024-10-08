import 'package:civic_flutter/core/services/mention_hashtag_link_text_controller.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_text_provider.g.dart';

@Riverpod(keepAlive: true)
class PostText extends _$PostText {
  @override
  Raw<TextEditingController> build() {
    
    final controller = MentionHashtagLinkTextEditingController(
      
    );
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
