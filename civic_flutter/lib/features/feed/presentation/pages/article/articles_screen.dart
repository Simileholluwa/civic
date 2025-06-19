import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticlesScreen extends ConsumerWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedArticleListProvider.notifier);

    return AppInfiniteList<Post>(
      pagingController: pagingControllerNotifier.pagingController,
      scrollController: ref.read(articleScrollControllerProvider),
      itemBuilder: (context, post, index) {
        final livePost = ref.watch(
          postStreamProvider(
            post.id!,
            post,
          ),
        );
        final newPost = livePost.value ?? post;
        final postCardState = ref.watch(feedButtonsProvider(newPost));
        return Column(
          spacing: 10,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
              child: ContentCreatorInfo(
                creator: postCardState.creator!,
                timeAgo: postCardState.timeAgo,
              ),
            ),
            Container(
              width: double.maxFinite,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  TSizes.md,
                ),
                color: Theme.of(context).cardColor,
                border: Border.all(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(TSizes.md),
                      topRight: Radius.circular(TSizes.md),
                    ),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: ContentCachedImage(
                        url: postCardState.articleBanner,
                        height: 200,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          postCardState.text,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.left,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: ContentExpandableText(
                            text: postCardState.text,
                            hasImage: postCardState.hasImage,
                            hasVideo: postCardState.hasVideo,
                            noMaxLines: true,
                            onToggleTextTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (postCardState.hasTags || postCardState.hasLocation)
              ContentEngagementTagsAndLocations(
                tags: postCardState.tags,
                locations: postCardState.locations,
                hasTags: postCardState.hasTags,
                hasLocations: postCardState.hasLocation,
              ),
            if (true)
              PostInteractionButtons(
                post: livePost.value ?? post,
                onReply: () {
                  context.push(
                    '/feed/post/${post.id}/comments',
                  );
                },
                originalPostId: post.id!,
              ),
          ],
        );
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
