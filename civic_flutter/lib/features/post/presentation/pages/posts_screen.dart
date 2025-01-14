import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedPostListProvider.notifier);

    return AppInfiniteList<Post>(
      pagingController: pagingControllerNotifier.pagingController,
      scrollController: ref.read(postScrollControllerProvider),
      itemBuilder: (context, post, index) {
        final postCardState = ref.watch(
          postCardWidgetProvider(post),
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
              child: ContentCreatorInfo(
                creator: postCardState.creator,
                timeAgo: postCardState.timeAgo,
                numberOfViews: postCardState.numberOfViews,
              ),
            ),
            if (postCardState.hasText)
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: ContentExpandableText(
                  text: postCardState.text,
                  hasImage: postCardState.hasImage,
                  hasVideo: postCardState.hasVideo,
                ),
              ),
            if (postCardState.hasImage)
              postCardState.imageUrls.length == 1
                  ? ContentSingleCachedImage(
                    imageUrl: postCardState.imageUrls.first,
                  )
                  : ContentMultipleCachedImage(
                    imageUrls: postCardState.imageUrls,
                  ),
            if (postCardState.hasVideo)
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: VideoPost(
                  videoUrl: postCardState.videoUrl,
                ),
              ),
            if (postCardState.hasLocation || postCardState.hasTags)
              ContentTagsAndLocations(
                tags: postCardState.tags,
                locations: postCardState.locations,
                hasTags: postCardState.hasTags,
                hasLocations: postCardState.hasLocation,
              ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ContentInteractionButton(
                    icon: Iconsax.heart,
                    title: '1.2k',
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.messages_1,
                    title: '1.2k',
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.repeate_music5,
                    title: '1.2k',
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Icons.share,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.bookmark,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                  ContentInteractionButton(
                    icon: Iconsax.more_2,
                    title: '',
                    showTitle: false,
                    onTap: () {},
                    color: Theme.of(context).textTheme.labelMedium!.color!,
                  ),
                ],
              ),
            ),
            if (index !=
                pagingControllerNotifier.pagingController.itemList!.length - 1)
              const Divider(
                height: 0,
              ),
          ],
        );
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
