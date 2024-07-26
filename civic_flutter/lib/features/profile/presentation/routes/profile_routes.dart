import 'package:civic_flutter/features/profile/presentation/pages/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileRoutes {
  static String namespace = '/profile';
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'Profile Screen',
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (_, __) => const ProfileScreen(),
      ),
    ],
  );
}
