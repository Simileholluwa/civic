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
  int build(String? tabName) {
    if (tabName == null) return 0;
    switch (tabName) {
      case 'project':
        return 0;
      case 'post':
        return 1;
      case 'poll':
        return 2;
      case 'article':
        return 3;
      default:
        return 0;
    }
  }

  void setCurrentPage(int index) {
    state = index;
  }
}

@riverpod
class FeedPageController extends _$FeedPageController {
  @override
  Raw<PageController> build(String? tabName) {
    int initialPage;
    if (tabName == null) {
      initialPage = 0;
    }
    switch (tabName) {
      case 'project':
        initialPage = 0;
        break;
      case 'post':
        initialPage = 1;
        break;
      case 'poll':
        initialPage = 2;
        break;
      case 'article':
        initialPage = 3;
        break;
      default:
        initialPage = 0;
        break;
    }
    return PageController(
      initialPage: initialPage,
    );
  }

  void gotoPage(int index) {
    ref
        .watch(
          feedCurrentPageProvider(
            tabName,
          ).notifier,
        )
        .setCurrentPage(
          index,
        );
    state.jumpToPage(
      index,
    );
  }
}
