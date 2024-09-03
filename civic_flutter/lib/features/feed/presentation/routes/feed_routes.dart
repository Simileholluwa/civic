import 'package:civic_flutter/features/feed/presentation/pages/feed_screen.dart';
import 'package:civic_flutter/features/post/presentation/pages/post_detail_screen.dart';
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
      ),
      GoRoute(
        path: PostDetailScreen.route(),
        builder: (context, state) => PostDetailScreen(
          id: int.tryParse(state.pathParameters['id'] ?? '') ?? 0,
        ),
      ),
    ],
  );
}
