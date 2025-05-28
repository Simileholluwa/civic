import 'package:civic_flutter/features/create/presentation/widgets/create_dialog.dart';
import 'package:civic_flutter/features/post/post.dart';
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
        builder: (context, state) => CreateContentDialog(),
        routes: [
          GoRoute(
            path: 'post/:postId',
            builder: (context, state) {
              final data = state.extra as Map<String, dynamic>?;
              return CreatePostScreen(
                id: int.tryParse(state.pathParameters['postId'] ?? '0') ?? 0,
                project: data?['project'],
                parent: data?['parent'],
              );
            },
          ),
          GoRoute(
            path: 'project/:projectId',
            builder: (context, state) {
              return CreateProjectScreen(
                id: int.tryParse(state.pathParameters['projectId'] ?? '0') ?? 0,
              );
            },
          ),
        ],
      ),
    ],
  );
}
