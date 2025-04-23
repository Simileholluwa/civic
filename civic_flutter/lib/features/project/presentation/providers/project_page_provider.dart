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
    length: 2,
    vsync: ref.watch(vsyncProvider),
  );
}

@riverpod
class ProjectDetailsTabController extends _$ProjectDetailsTabController {
  @override
  Raw<TabController> build(String? tabName) { 
    int initialPage;
    if (tabName == null) {
      initialPage = 0;
    }
    switch (tabName) {
      case 'details':
        initialPage = 0;
        break;
      case 'overview':
        initialPage = 1;
        break;
      case 'reviews':
        initialPage = 2;
        break;
      case 'vettings':
        initialPage = 3;
        break;
      default:
        initialPage = 0;
        break;
    }
    return TabController(
    length: 4,
    vsync: ref.watch(vsyncProvider),
    initialIndex: initialPage,
  );}
}

@riverpod
class ProjectDetailCurrentPage extends _$ProjectDetailCurrentPage {
  @override
  int build() => 0;

  void setCurrentPage(int index) {
    state = index;
  }
}
