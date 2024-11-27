import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/features/feed/presentation/routes/feed_routes.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

Future<bool?> saveArticleDraftDialog(
  WidgetRef ref,
  BuildContext context,
  ArticleState articleState,
) =>
    postDialog(
      context: context,
      title: 'Save article as draft?',
      description: 'Draft article will be saved in drafts for '
          'a maximum of 10 days.',
      onTapSkipButton: () {
        context.go(
          FeedRoutes.namespace,
          extra: null,
        );
      },
      activeButtonText: 'Save as draft',
      activeButtonLoading: false,
      skipButtonLoading: false,
      skipText: "Don't save",
      onTapActiveButton: () async {
        if (context.mounted) {
          context.go(
            FeedRoutes.namespace,
            extra: null,
          );
        }
        final result = await ref
            .read(
              articleDraftsProvider.notifier,
            )
            .saveArticleDraft(
              ArticleHelperFunctions.createDraftFromArticleState(
                articleState,
              ),
            );
        if (result) {
          TToastMessages.successToast(
            'Your article has been saved as draft.',
          );
        }
      },
    );
