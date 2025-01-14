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

final feedScreenTabProvider = Provider<TabController>(
  (ref) => TabController(
    length: 3,
    vsync: ref.watch(feedVsyncProvider),
  ),
);

@riverpod
class FeedCurrentPage extends _$FeedCurrentPage {
  @override
  int build() => 0;

  void setCurrentPage(int index) {
    state = index;
  }

  void subtract() {
    state = state - 1;
  }

  void add() {
    state = state + 1;
  }
}

@riverpod
class FeedPageController extends _$FeedPageController {
  @override
  Raw<PageController> build() => PageController();

  void nextPage() {
    ref.watch(feedCurrentPageProvider.notifier).add();
    state.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    ref.watch(feedCurrentPageProvider.notifier).subtract();
    state.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void gotoPage(int index) {
    ref.watch(feedCurrentPageProvider.notifier).setCurrentPage(index);
    state.jumpToPage(
      index,
      // duration: const Duration(milliseconds: 300),
      // curve: Curves.easeInOut,
    );
  }
}
