import 'package:civic_flutter/features/learn/learn.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LearnRoutes {
  static String namespace = '/learn';
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'Learn Screen',
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (_, state) {
          return LearnScreen();
        },
      ),
    ],
  );
}
