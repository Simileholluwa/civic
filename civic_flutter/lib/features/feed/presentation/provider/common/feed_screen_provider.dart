import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'feed_screen_provider.g.dart';

class _VSync implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

@riverpod
TickerProvider feedVsync(Ref ref) => _VSync();

@riverpod
TickerProvider feedFilterVsync(Ref ref) => _VSync();

@riverpod
class FeedScreenTabController extends _$FeedScreenTabController {
  @override
  Raw<TabController> build() {
    final currentPage = ref.watch(feedCurrentPageProvider.notifier);
    final controller = TabController(
      length: 3,
      vsync: ref.watch(feedVsyncProvider),
    );
    controller.addListener(() {
      currentPage.currentPage = controller.index;
    });
    ref.onDispose(
      controller.dispose,
    );
    return controller;
  }
}

@riverpod
class FeedCurrentPage extends _$FeedCurrentPage {
  @override
  int build() => 0;

  set currentPage(int index) {
    state = index;
  }
}
