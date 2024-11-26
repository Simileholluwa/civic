import 'package:flutter/material.dart';
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
  PageController build() => PageController(
        initialPage: ref.watch(
          projectCurrentPageProvider,
        ),
      );

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
}
