import 'package:civic_flutter/features/discover/presentation/pages/discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DiscoverRoutes {
  static String namespace = '/discover';
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'Discover Screen',
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (_, __) => const DiscoverScreen(),
      ),
    ],
  );
}
