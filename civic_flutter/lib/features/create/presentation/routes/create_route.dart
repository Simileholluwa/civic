import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/create/presentation/pages/create_content_page.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateRoutes {
  static String namespace = '/create';
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'Create Screen',
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (context, state) => CreateContentScreen(),
        routes: [
          GoRoute(
            path: 'post/:postId',
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>?;
              return CreatePostScreen(
                id: int.tryParse(state.pathParameters['postId'] ?? '0') ?? 0,
                project: data?['project'],
                parent: data?['parent'],
                post: data?['post'],
              );
            },
          ),
          GoRoute(
            path: 'project/:projectId',
            builder: (context, state) {
              return CreateProjectScreen(
                id: int.tryParse(state.pathParameters['projectId'] ?? '0') ?? 0,
                project: state.extra as Project?,
              );
            },
          ),
          GoRoute(
            path: 'poll/:pollId',
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>?;
              return CreatePollScreen(
                id: int.tryParse(state.pathParameters['pollId'] ?? '0') ?? 0,
                post: data?['post'],
              );
            },
          ),
          GoRoute(
            path: 'article/:articleId',
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>?;
              return CreateArticleScreen(
                id: int.tryParse(state.pathParameters['articleId'] ?? '0') ?? 0,
                post: data?['post'],
              );
            },
          ),
        ],
      ),
    ],
  );
}
