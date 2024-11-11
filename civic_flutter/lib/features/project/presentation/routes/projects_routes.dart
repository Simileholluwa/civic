import 'package:civic_flutter/features/project/presentation/pages/projects_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectsRoutes {
  static String namespace = '/projects';
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'Projects Screen',
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (_, __) => const ProjectsScreen(),
      ),
    ],
  );
}
