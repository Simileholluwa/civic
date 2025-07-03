import 'package:civic_flutter/features/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotificationsRoutes {
  static String namespace = '/notifications';
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'Notifications Screen',
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (_, __) => const NotificationsScreen(),
      ),
    ],
  );
}
