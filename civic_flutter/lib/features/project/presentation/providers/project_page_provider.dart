import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_page_provider.g.dart';

@riverpod
class ProjectCurrentPage extends _$ProjectCurrentPage {
  @override
  int build() => 0;

  set setCurrentPage(int index) {
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

  Future<void> nextPage() async {
    ref.watch(projectCurrentPageProvider.notifier).add();
    await state.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> previousPage() async {
    ref.watch(projectCurrentPageProvider.notifier).subtract();
    await state.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> gotoPage(int index) async {
    ref
        .watch(
          projectCurrentPageProvider.notifier,
        )
        .setCurrentPage = index;
    await state.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

class _VSync implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

final vsyncProvider = Provider<TickerProvider>(
  (ref) => _VSync(),
);

@riverpod
class ProjectTabController extends _$ProjectTabController {
  @override
  Raw<TabController> build() {
    final controller = TabController(
      length: 2,
      vsync: ref.watch(vsyncProvider),
    );
    ref.onDispose(controller.dispose);
    return controller;
  }
}

@riverpod
class ProjectDetailsTabController extends _$ProjectDetailsTabController {
  @override
  Raw<TabController> build() {
    final controller = TabController(
      length: 4,
      vsync: ref.watch(vsyncProvider),
    );
    controller.addListener(() {
      ref.watch(projectDetailCurrentPageProvider.notifier).setCurrentPage =
          controller.index;
    });
    ref.onDispose(controller.dispose);
    return controller;
  }
}

@riverpod
class ProjectDetailsBackPageTabController extends _$ProjectDetailsBackPageTabController {
  @override
  Raw<TabController> build() {
    return TabController(
      length: 3,
      vsync: ref.watch(vsyncProvider),
    );
  }
}

@riverpod
class ProjectDetailCurrentPage extends _$ProjectDetailCurrentPage {
  @override
  int build() => 0;

  set setCurrentPage(int index) {
    state = index;
  }
}
