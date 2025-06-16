// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'poll_scroll_controller_provider.g.dart';

@riverpod
class PollScrollController extends _$PollScrollController {
  static late ScrollController _scrollController;
  @override
  Raw<ScrollController> build() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    return _scrollController;
  }

  void _scrollListener() {
    final visibilityNotifier = ref.read(
      appScrollVisibilityProvider(
        true,
      ).notifier,
    );
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      visibilityNotifier.hide();
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      visibilityNotifier.show();
    }
  }
}
