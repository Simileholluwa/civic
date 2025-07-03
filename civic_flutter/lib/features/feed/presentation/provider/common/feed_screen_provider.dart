// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'feed_screen_provider.g.dart';

class _VSync implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

final feedVsyncProvider = Provider<TickerProvider>(
  (ref) => _VSync(),
);

final feedFilterVsyncProvider = Provider<TickerProvider>(
  (ref) => _VSync(),
);

@riverpod
class FeedScreenTabController extends _$FeedScreenTabController {
  @override
  Raw<TabController> build() {
    final currentPage = ref
          .watch(feedCurrentPageProvider.notifier);        
    final controller = TabController(
      length: 3,
      vsync: ref.watch(feedVsyncProvider),
    );
    controller.addListener(() {
      currentPage.setCurrentPage(controller.index);
    });
    ref.onDispose(() {
      controller.dispose();
    });
    return controller;
  }
}

@riverpod
class FeedCurrentPage extends _$FeedCurrentPage {
  @override
  int build() => 0;

  void setCurrentPage(int index) {
    state = index;
  }
}
