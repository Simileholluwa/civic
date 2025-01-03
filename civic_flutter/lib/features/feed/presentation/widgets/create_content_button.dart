import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/providers/mention_hashtag_link_provider.dart';
import 'package:civic_flutter/core/providers/scheduled_datetime_provider.dart';
import 'package:civic_flutter/core/providers/tag_selections_provider.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateContentButton extends ConsumerWidget {
  const CreateContentButton({super.key, required this.index,});
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    void invalidateProviders() {
      ref.invalidate(postScheduledDateTimeProvider);
      ref.invalidate(tagSelectionsProvider);
      ref.invalidate(selectedMentionsProvider);
      ref.invalidate(hashtagsProvider);
    }

    void navigate() {
      switch (index) {
        case 0:
          invalidateProviders();

          context.push(
            AppRoutes.createPost,
            extra: {
              'id': 0,
              'draft': null,
            },
          );
          break;
        case 2:
          invalidateProviders();

          context.push(
            AppRoutes.createArticle,
            extra: {
              'id': 0,
              'draft': null,
            },
          );
          break;
        case 1:
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
      }
    }

    return InkWell(
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
          size: 35,
        ),
      ),
    );
  }
}
