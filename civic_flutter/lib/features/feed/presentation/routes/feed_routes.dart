import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
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
              path: ':type/:id',
              builder: (context, state) {
                final type = state.pathParameters['type'];
                if (type == 'post') {
                  return DetailScreen(
                    id: int.tryParse(state.pathParameters['id'] ?? '0') ?? 0,
                    post: state.extra as Post?,
                    postType: PostType.regular,
                    draftType: 'postDraft',
                  );
                } else if (type == 'poll') {
                  return DetailScreen(
                    id: int.tryParse(state.pathParameters['id'] ?? '0') ?? 0,
                    post: state.extra as Post?,
                    postType: PostType.poll,
                    draftType: 'pollDraft',
                  );
                } else {
                  return DetailScreen(
                    id: int.tryParse(state.pathParameters['id'] ?? '0') ?? 0,
                    post: state.extra as Post?,
                    postType: PostType.article,
                    draftType: 'articleDraft',
                  );
                }
              },
              routes: [
                GoRoute(
                  path: 'comments',
                  builder: (_, state) {
                    return CommentScreen(
                      id: int.tryParse(state.pathParameters['id'] ?? '') ?? 0,
                    );
                  },
                ),
                GoRoute(
                  path: 'notInterested',
                  builder: (_, state) {
                    final data = state.extra as Map<String, dynamic>;
                    return MarkNotInterested(
                      post: data['post'],
                      originalPostId: data['originalPostId'],
                    );
                  },
                ),
                GoRoute(
                  path: 'replies/:replyId',
                  builder: (_, state) {
                    return RepliesScreen(
                      replyId:
                          int.tryParse(state.pathParameters['replyId'] ?? '') ??
                              0,
                    );
                  },
                ),
              ]),
        ],
      ),
    ],
  );
}
