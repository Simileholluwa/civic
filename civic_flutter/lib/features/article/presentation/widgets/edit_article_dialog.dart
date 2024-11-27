import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:go_router/go_router.dart';

Future<bool?> editArticleDialog(
  WidgetRef ref,
  BuildContext context,
) =>
    postDialog(
      context: context,
      title: 'Exit editing?',
      description:
          'Are you sure you want to exit? Your changes will not be saved.',
      onTapSkipButton: () {
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
    );
