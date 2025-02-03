// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_page_provider.g.dart';

@riverpod
class ProjectCurrentPage extends _$ProjectCurrentPage {
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
class ProjectPageController extends _$ProjectPageController {
  @override
  Raw<PageController> build() => PageController();

  void nextPage() {
    ref.watch(projectCurrentPageProvider.notifier).add();
    state.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    ref.watch(projectCurrentPageProvider.notifier).subtract();
    state.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void gotoPage(int index) {
    ref.watch(projectCurrentPageProvider.notifier).setCurrentPage(index);
    state.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class _VSync implements TickerProvider{
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

final vsyncProvider = Provider<TickerProvider>(
  (ref) => _VSync(),
);


@riverpod
class ProjectTabController extends _$ProjectTabController {
  @override
  Raw<TabController> build() => TabController(
    length: 3,
    vsync: ref.watch(vsyncProvider),
  );

  void setTabIndex(int index) {
    state.index = index;
    state.animateTo(index);
  }
}

@riverpod
class ProjectDetailPageController extends _$ProjectDetailPageController {
  @override
  Raw<PageController> build() => PageController();

  void nextPage() {
    ref.watch(projectDetailCurrentPageProvider.notifier).add();
    state.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previousPage() {
    ref.watch(projectDetailCurrentPageProvider.notifier).subtract();
    state.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void gotoPage(int index) {
    ref.watch(projectDetailCurrentPageProvider.notifier).setCurrentPage(index);
    state.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void jumpToPage(int index) {
    ref.watch(projectDetailCurrentPageProvider.notifier).setCurrentPage(index);
    state.jumpToPage(
      index,
    );
  }
}

@riverpod
class ProjectDetailCurrentPage extends _$ProjectDetailCurrentPage {
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
