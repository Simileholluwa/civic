import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectVettingCard extends ConsumerWidget {
  const ProjectVettingCard({
    required this.projectVettingWithUserState,
    super.key,
  });

  final ProjectVettingWithUserState projectVettingWithUserState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vettingWithKey = ProjectVettingWithUserStateKey(
      projectVettingWithUserState,
    );
    final reactToVettingNotifier = ref.read(
      vettingReactionProvider(
        vettingWithKey,
      ).notifier,
    );
    final reactToVettingState = ref.watch(
      vettingReactionProvider(
        vettingWithKey,
      ),
    );
    final projectVetting = projectVettingWithUserState.vetting;
    final projectVettingNotifier = ref.read(
      projectVetProvider(projectVetting).notifier,
    );
    final userId = ref.read(localStorageProvider).getInt('userId');
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          ContentCreatorInfo(
            timeAgo: THelperFunctions.humanizeDateTime(
              projectVetting.createdAt ?? DateTime.now(),
            ),
            creator: projectVetting.owner!,
          ),
          ContentExpandableText(
            text: projectVetting.comment ?? 'No comment',
            expandOnTextTap: true,
            hasVideo: true,
          ),
          if (projectVetting.images!.length == 1)
            ContentSingleCachedImage(
              useMargin: false,
              imageUrl: projectVetting.images![0],
              aspectRatio: 300,
            )
          else
            ContentMultipleCachedImage(
              imageUrls: projectVetting.images!,
              useMargin: false,
            ),
          ReactToReviewOrVetting(
            text: 'Is this vetting accurate?',
            likesCount: reactToVettingState.likesCount,
            likeTextColor:
                reactToVettingState.isLiked && !reactToVettingState.isDeleted
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onSurface,
            dislikeTextColor:
                reactToVettingState.isDisliked && !reactToVettingState.isDeleted
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.onSurface,
            likeTapped: () async {
              await reactToVettingNotifier.reactToVetting(
                true,
              );
            },
            dislikeTapped: () async {
              await reactToVettingNotifier.reactToVetting(
                false,
              );
            },
            isOwner: projectVetting.ownerId == userId,
            onDelete: () async {
              await ProjectHelperFunctions.deleteProjectVettingDialog(
                context,
                projectVettingNotifier,
                projectVetting.id!,
                false,
              );
            },
          ),
        ],
      ),
    );
  }
}
