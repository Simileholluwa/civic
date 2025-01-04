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
                    child: ContentCreatorInfo(
                      creator: postCardState.creator,
                      timeAgo: postCardState.timeAgo,
                      numberOfViews: postCardState.numberOfViews,
                    ),
                  ),
                  if (postCardState.hasText)
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: ContentExpandableText(
                            text: postCardState.text,
                            hasImage: postCardState.hasImage,
                            hasVideo: postCardState.hasVideo,
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
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                          child: VideoPost(
                            videoUrl: postCardState.videoUrl,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  if (postCardState.hasText &&
                      !postCardState.hasImage &&
                      !postCardState.hasVideo)
                    const SizedBox(
                      height: 10,
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
