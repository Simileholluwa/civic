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
          final sendPost = state.extra as VoidCallback?;
          return FeedScreen(
            sendPost: sendPost,
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
            path: CreatePostScreen.routePath(),
            name: CreatePostScreen.routeName(),
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>;
              return CreatePostScreen(
                id: int.tryParse(state.pathParameters['id'] ?? '0') ?? 0,
                draft: data['draft'],
                project: data['project'],
              );
            },
          ),
          GoRoute(
            path: ProjectDetailsScreen.routePath(),
            name: ProjectDetailsScreen.routeName(),
            builder: (_, state) {
              return ProjectDetailsScreen(
                id: int.tryParse(state.pathParameters['id'] ?? '0') ?? 0,
              );
            },
          ),
          GoRoute(
            path: ProjectReviewScreen.routePath(),
            name: ProjectReviewScreen.routeName(),
            builder: (_, state) {
              return ProjectReviewScreen(
                id: int.tryParse(state.pathParameters['id'] ?? '') ?? 0,
              );
            },
          ),
          GoRoute(
            path: ProjectVerifyScreen.routePath(),
            name: ProjectVerifyScreen.routeName(),
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
  );
}
