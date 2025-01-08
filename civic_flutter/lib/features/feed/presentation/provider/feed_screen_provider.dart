import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _VSync implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

final feedVsyncProvider = Provider<TickerProvider>(
  (ref) => _VSync(),
);

final feedFilteerVsyncProvider = Provider<TickerProvider>(
  (ref) => _VSync(),
);

final feedScreenTabProvider = Provider<TabController>(
  (ref) => TabController(
    length: 3,
    vsync: ref.watch(feedVsyncProvider),
  ),
);