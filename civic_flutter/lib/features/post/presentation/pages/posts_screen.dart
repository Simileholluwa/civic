import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:expandable_richtext/expandable_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PostsScreen extends ConsumerWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTextStyle = DefaultTextStyle.of(context);
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
          children: [
            Container(
              decoration: BoxDecoration(
                color: TColors.primary.withValues(
                  alpha: 0.01,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 12, 15, 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: CachedNetworkImageProvider(
                            postCardState.photoUrl,
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    child: Text(
                                      postCardState.displayName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium!
                                          .copyWith(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  if (postCardState.hasCredibility)
                                    Row(
                                      children: [
                                        const Icon(
                                          Iconsax.star5,
                                          color: TColors.primary,
                                          size: 14,
                                        ),
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          postCardState.credibilityScore,
                                          style:
                                              defaultTextStyle.style.copyWith(
                                            color: TColors.primary,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                              Text(
                                postCardState.bio,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 13,
                                    ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '@${postCardState.userName} • ${postCardState.timeAgo} • ${postCardState.numberOfViews} views',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      fontSize: 13,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (postCardState.hasText)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: ExpandableRichText(
                            postCardState.text,
                            expandText: 'see more',
                            collapseText: 'see less',
                            mentionStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 17,
                                  color: TColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                            
                            hashtagStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 17,
                                  color: TColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                            toggleTextColor: TColors.primary,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 17,
                                ),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  if (postCardState.hasImage)
                    Column(
                      children: [
                        if (postCardState.hasText)
                          const SizedBox(
                            height: 15,
                          ),
                        if (!postCardState.hasText)
                          const SizedBox(
                            height: 10,
                          ),
                        postCardState.imageUrls.length == 1
                            ? ContentKeepAliveWrapper(
                                child: ContentSingleCachedImage(
                                  imageUrl: postCardState.imageUrls.first,
                                ),
                              )
                            : ContentKeepAliveWrapper(
                                child: ContentMultipleCachedImage(
                                  imageUrls: postCardState.imageUrls,
                                ),
                              ),
                      ],
                    ),
                  if (postCardState.hasVideo)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            15, 10, 15, 0,
                          ),
                          child: VideoPost(
                            videoUrl: postCardState.videoUrl,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContentInteractionButton(
                          icon: Iconsax.heart,
                          title: '1.2k',
                          onTap: () {},
                          color:
                              Theme.of(context).textTheme.labelMedium!.color!,
                        ),
                        ContentInteractionButton(
                          icon: Iconsax.messages_1,
                          title: '1.2k',
                          onTap: () {},
                          color:
                              Theme.of(context).textTheme.labelMedium!.color!,
                        ),
                        ContentInteractionButton(
                          icon: Iconsax.repeate_music5,
                          title: '1.2k',
                          onTap: () {},
                          color:
                              Theme.of(context).textTheme.labelMedium!.color!,
                        ),
                        ContentInteractionButton(
                          icon: Icons.share,
                          title: '',
                          showTitle: false,
                          onTap: () {},
                          color:
                              Theme.of(context).textTheme.labelMedium!.color!,
                        ),
                        ContentInteractionButton(
                          icon: Iconsax.bookmark,
                          title: '',
                          showTitle: false,
                          onTap: () {},
                          color:
                              Theme.of(context).textTheme.labelMedium!.color!,
                        ),
                        ContentInteractionButton(
                          icon: Iconsax.more_2,
                          title: '',
                          showTitle: false,
                          onTap: () {},
                          color:
                              Theme.of(context).textTheme.labelMedium!.color!,
                        ),
                      ],
                    ),
                  ),
                  if (index !=
                      pagingControllerNotifier
                              .pagingController.itemList!.length -
                          1)
                    const Divider(
                      height: 0,
                    ),
                ],
              ),
            ),
          ],
        );
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
