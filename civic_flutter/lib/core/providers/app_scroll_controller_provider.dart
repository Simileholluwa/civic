// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_scroll_controller_provider.g.dart';

@riverpod
class AppScrollController extends _$AppScrollController {
  static late ScrollController _scrollController;
  @override
  Raw<ScrollController> build() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    return _scrollController;
  }

  void _scrollListener() {
    final visibilityNotifier = ref.read(scrollVisibilityProvider.notifier);
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      visibilityNotifier.hide();
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      visibilityNotifier.show();
    }
  }
}

final scrollVisibilityProvider =
    StateNotifierProvider<ScrollVisibilityNotifier, bool>(
  (ref) => ScrollVisibilityNotifier(),
);

class ScrollVisibilityNotifier extends StateNotifier<bool> {
  ScrollVisibilityNotifier() : super(true);

  void hide() => state = false;
  void show() => state = true;
}
