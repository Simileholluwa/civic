import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectVettingCard extends ConsumerWidget {
  const ProjectVettingCard({
    super.key,
    required this.projectVetting,
  });

  final ProjectVetting projectVetting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reactToVettingNotifier = ref.watch(
      vettingReactionProvider(
        projectVetting,
      ).notifier,
    );
    final reactToVettingState = ref.watch(
      vettingReactionProvider(
        projectVetting,
      ),
    );
    final projectVettingNotifier = ref.watch(
      ProjectVetProvider(projectVetting).notifier,
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
            onToggleTextTap: null,
            hasVideo: true,
          ),
          projectVetting.images!.length == 1
              ? ContentSingleCachedImage(
                  useMargin: false,
                  imageUrl: projectVetting.images![0],
                )
              : ContentMultipleCachedImage(
                  imageUrls: projectVetting.images!,
                  useMargin: false,
                ),
          ReactToReviewOrVetting(
            text: 'Is this vetting accurate?',
            likesCount: reactToVettingState.likesCount,
            likeTextColor: reactToVettingState.isLiked &&
                    reactToVettingState.isDeleted == false
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
            dislikeTextColor: reactToVettingState.isDisliked &&
                    reactToVettingState.isDeleted == false
                ? Theme.of(context).colorScheme.secondary
                : Theme.of(context).colorScheme.onSurface,
            likeTapped: () {
              reactToVettingNotifier.reactToVetting(
                true,
              );
            },
            dislikeTapped: () {
              reactToVettingNotifier.reactToVetting(
                false,
              );
            },
            isOwner: projectVetting.ownerId == userId,
            onDelete: () {
              ProjectHelperFunctions.deleteProjectVettingDialog(
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
