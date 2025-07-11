// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notification_page_provider.g.dart';

@riverpod
class NotificationTabController extends _$NotificationTabController {
  @override
  Raw<TabController> build() { 
    final currentPage = ref
          .watch(notificationPageProvider.notifier);        
    final controller = TabController(
      length: 4,
      vsync: ref.watch(tabVsyncProvider),
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

class _VSync implements TickerProvider{
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

final tabVsyncProvider = Provider<TickerProvider>(
  (ref) => _VSync(),
);

@riverpod
class NotificationPage extends _$NotificationPage {
  @override
  int build() => 0;

  void setCurrentPage(int index) {
    state = index;
  }
}