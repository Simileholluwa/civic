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
          return FeedScreen(
            tabName: state.pathParameters['tabName'],
          );
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
            path: ':tabName/:id',
            builder: (_, state) {
              return ProjectDetailsScreen(
                id: int.tryParse(state.pathParameters['id'] ?? '0') ?? 0,
              );
            },
            routes: [
              GoRoute(
                path: 'review',
                builder: (_, state) {
                  return ProjectReviewScreen(
                    id: int.tryParse(state.pathParameters['id'] ?? '') ?? 0,
                  );
                },
              ),
              GoRoute(
                path: 'verify',
                builder: (_, state) {
                  return ProjectVerifyScreen(
                    id: int.tryParse(state.pathParameters['id'] ?? '') ?? 0,
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
