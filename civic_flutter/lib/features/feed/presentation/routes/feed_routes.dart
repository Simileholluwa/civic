import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/presentation/pages/feed_screen.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeedRoutes {
  static String namespace = '/feed';
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'Feed Screen',
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (_, state) {
          return FeedScreen();
        },
        routes: [
          GoRoute(
            path: PostDetailScreen.routePath(),
            name: PostDetailScreen.routeName(),
            builder: (context, state) => PostDetailScreen(
              id: int.tryParse(state.pathParameters['id'] ?? '') ?? 0,
            ),
          ),
          GoRoute(
            path: ':projectId/:tab',
            builder: (_, state) {
              return ProjectDetailsScreen(
                projectId: int.tryParse(state.pathParameters['projectId'] ?? '0') ?? 0,
                tab: state.pathParameters['tab'],
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
                path: 'verify',
                builder: (_, state) {
                  return ProjectVettingScreen(
                    projectId: int.tryParse(state.pathParameters['projectId'] ?? '') ?? 0,
                    projectLocations: state.extra as List<AWSPlaces>,
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
