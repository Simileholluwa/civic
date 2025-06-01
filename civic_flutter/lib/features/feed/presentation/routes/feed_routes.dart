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
            path: 'post/:postId',
            builder: (context, state) => PostDetailScreen(
              id: int.tryParse(state.pathParameters['postId'] ?? '0') ?? 0,
              post: state.extra as Post?,
            ),
            routes: [
              GoRoute(
                path: 'comments',
                builder: (_, state) {
                  return PostCommentScreen(
                    postId: int.tryParse(state.pathParameters['postId'] ?? '') ?? 0,
                  );
                },
              ),
              GoRoute(
                path: 'notInterested',
                builder: (_, state) {
                  return MarkPostNotInterested(
                    post: state.extra as Post,
                  );
                },
              ),
              GoRoute(
                path: 'replies/:replyId',
                builder: (_, state) {
                  return PostRepliesScreen(
                    replyId: int.tryParse(state.pathParameters['replyId'] ?? '') ?? 0,
                  );
                },
              ),
              
            ]
          ),
          GoRoute(
            path: 'project/:projectId',
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
