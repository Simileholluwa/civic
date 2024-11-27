import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<bool?> editPostDialog(
  WidgetRef ref,
  BuildContext context,
  Post post,
) {
  final postState = ref.watch(regularPostProvider(post));
    return postDialog(
      context: context,
      title: 'Exit editing?',
      description:
          'Are you sure you want to exit? Your changes will not be saved.',
      onTapSkipButton: () {
        
        if (postState.videoUrl.isNotEmpty) {
          ref
              .read(mediaVideoPlayerProvider(postState.videoUrl).notifier)
              .dispose();
        }
        context.go(
          FeedRoutes.namespace,
          extra: null,
        );
      },
      activeButtonText: 'Continue editing',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: "Exit without saving",
      onTapActiveButton: () {
        context.pop();
      },
    );}
