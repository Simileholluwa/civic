import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/presentation/provider/feed_screen_provider.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateContentButton extends ConsumerWidget {
  const CreateContentButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(feedCurrentPageProvider);
    final isVisible = ref.watch(appScrollVisibilityProvider);

    void invalidateProviders() {
      ref.invalidate(postScheduledDateTimeProvider);
      ref.invalidate(tagSelectionsProvider);
      ref.invalidate(selectedMentionsProvider);
      ref.invalidate(hashtagsProvider);
    }

    void navigate() {
      switch (currentPage) {
        case 1:
          invalidateProviders();

          context.pushNamed(
            CreatePostScreen.routeName(),
            extra: {
              'draft': null,
              'project': null,
            },
            pathParameters: {
              'id': '0',
            },
          );
          break;
        case 3:
          invalidateProviders();

          context.push(
            AppRoutes.createArticle,
            extra: {
              'id': 0,
              'draft': null,
            },
          );
          break;
        case 2:
          invalidateProviders();
          ref.invalidate(pollsOptionsProvider);

          context.push(
            AppRoutes.createPoll,
            extra: {
              'id': 0,
              'draft': null,
            },
          );
          break;
        case 0:
          context.push(
            AppRoutes.createProject,
            extra: {
              'id': 0,
            },
          );
          break;
      }
    }

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: !isVisible ? 0 : 1,
      child: Visibility(
        visible: isVisible,
        child: GestureDetector(
          onTap: navigate,
          child: Container(
            height: 70,
            width: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: TColors.primary,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
