import 'package:civic_flutter/features/network/network.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NetworkRoutes {
  static String namespace = '/network';
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'Network Screen',
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (context, state) => NetworkScreen(),
        routes: [
          GoRoute(
            path: ':userId',
            builder: (context, state) {
              return UserProfile(
                userId: int.tryParse(state.pathParameters['userId'] ?? '') ?? 0,
              );
            },
          ),
        ],
      ),
    ],
  );
}
