import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProjectRoutes {
  static String namespace = '/project';
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'Project Screen',
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (_, state) {
          return ProjectsScreen();
        },
        routes: [
          GoRoute(
            path: 'bookmarks',
            builder: (context, state) {
              return const ProjectBookmarksScreen();
            },
          ),
          GoRoute(
            path: ':projectId',
            builder: (_, state) {
              return ProjectDetailsScreen(
                projectId: int.tryParse(state.pathParameters['projectId'] ?? '0') ?? 0,
                project: state.extra as Project?,
              );
            },
            routes: [
              GoRoute(
                path: 'review',
                builder: (_, state) {
                  return ProjectReviewScreen(
                    projectId: int.tryParse(state.pathParameters['projectId'] ?? '') ?? 0,
                  );
                },
              ),
              GoRoute(
                path: 'vet',
                builder: (_, state) {
                  return ProjectVettingScreen(
                    projectId: int.tryParse(state.pathParameters['projectId'] ?? '') ?? 0,
                    projectLocations: state.extra as List<AWSPlaces>?,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
