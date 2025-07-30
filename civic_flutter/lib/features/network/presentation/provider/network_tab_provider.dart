// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'network_tab_provider.g.dart';

class _VSync implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

final networkVsyncProvider = Provider<TickerProvider>(
  (ref) => _VSync(),
);

@riverpod
class NetworkTabController extends _$NetworkTabController {
  @override
  Raw<TabController> build() {
    final currentPage = ref
          .watch(networkCurrentPageProvider.notifier);        
    final controller = TabController(
      length: 9,
      vsync: ref.watch(networkVsyncProvider),
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
class NetworkCurrentPage extends _$NetworkCurrentPage {
  @override
  int build() => 0;

  void setCurrentPage(int index) {
    state = index;
  }
}