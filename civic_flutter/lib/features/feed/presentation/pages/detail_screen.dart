import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({
    required this.id,
    required this.postType,
    super.key,
    this.post,
  });

  final int id;
  final Post? post;
  final PostType postType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPost = ref.watch(
      postDetailProvider(id, post, postType),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: AppBar(
            titleSpacing: 0,
            leading: IconButton(
              icon: const Icon(
                Iconsax.arrow_left_2,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            actions: [
              asyncPost.when(
                data: (value) {
                  final postData = value.post;
                  final userId =
                      ref.read(localStorageProvider).getInt('userId');
                  final isOwner = postData.ownerId == userId;
                  final isSubscribed = ref.watch(
                    feedButtonsProvider(PostWithUserStateKey(value)).select(
                      (s) => s.isSubscribed,
                    ),
                  );
                  final notifier = ref.read(
                    feedButtonsProvider(PostWithUserStateKey(value)).notifier,
                  );
                  return Row(
                    children: [
                      IconButton(
                        onPressed: isOwner
                            ? null
                            : () async {
                                await notifier.subscribeToNotifications(
                                  postData.id!,
                                );
                              },
                        icon: Icon(
                          isSubscribed
                              ? Iconsax.notification5
                              : Iconsax.notification,
                          color: isOwner
                              ? Theme.of(context).disabledColor
                              : isSubscribed
                                  ? TColors.primary
                                  : Theme.of(context).iconTheme.color,
                        ),
                      ),
                      const SizedBox(width: 5),
                    ],
                  );
                },
                error: (_, __) => const SizedBox.shrink(),
                loading: () => const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
      body: asyncPost.when(
        data: (value) {
          final likes = ref.watch(
            feedButtonsProvider(PostWithUserStateKey(value))
                .select((s) => s.numberOfLikes),
          );
          final formattedLikes = FeedHelperFunctions.humanizeNumber(
            likes,
          );
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                if (value.post.isDeleted!)
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                        child: ContentCreatorInfo(
                          creator: value.post.owner!,
                          timeAgo: THelperFunctions.humanizeDateTime(
                            value.post.dateCreated!,
                          ),
                          onMoreTapped: () async {
                            await showDialog<dynamic>(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  contentPadding: const EdgeInsets.only(
                                    bottom: 16,
                                  ),
                                  content: ShowPostActions(
                                    postWithUserState: value,
                                    originalPostId: value.post.id!,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(
                            TSizes.sm,
                          ),
                        ),
                        child: const Text(
                          'This post is no longer available. It may have been deleted or removed.',
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      if (postType == PostType.regular)
                        RepaintBoundary(
                          child: PostCardDetail(
                            postWithUserState: value,
                            showInteractions: false,
                            onTap: null,
                            noMaxLines: true,
                          ),
                        ),
                      if (postType == PostType.poll)
                        RepaintBoundary(
                          child: Column(
                            spacing: 10,
                            children: [
                              PollCard(
                                postWithUserState: value,
                                showInteractions: false,
                              ),
                              const Divider(
                                height: 0,
                              ),
                            ],
                          ),
                        ),
                      if (postType == PostType.article)
                        RepaintBoundary(
                          child: ArticleDetailCard(
                            postWithUserState: value,
                          ),
                        ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('hh:mm a • MMM d, y')
                            .format(value.post.dateCreated!),
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context).hintColor,
                                ),
                      ),
                      if (likes > 0)
                        Text(
                          likes == 1
                              ? '$formattedLikes like'
                              : '$formattedLikes likes',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                        ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Divider(
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: PostDetailOptions(
                        postWithUserState: value,
                        isPoll: postType == PostType.poll,
                        isArticle: postType == PostType.article,
                      ),
                    ),
                    const Divider(
                      height: 0,
                    ),
                  ],
                ),
                if (value.post.postType == PostType.commentReply ||
                    value.post.postType == PostType.comment)
                  RepaintBoundary(
                    child: PostCommentReplyCard(
                      postId: value.post.id!,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    ),
                  ),
                if (value.post.postType == PostType.regular ||
                    value.post.postType == PostType.poll ||
                    value.post.postType == PostType.article ||
                    value.post.postType == PostType.projectQuote)
                  RepaintBoundary(
                    child: PostCommentCard(
                      id: value.post.id!,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      firstPageProgressIndicator: Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                        ),
                        child: Center(
                          child: LoadingAnimationWidget.progressiveDots(
                            color: TColors.primary,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
        error: (error, st) {
          final err = error as Map<String, String>;
          return Center(
            child: LoadingError(
              retry: null,
              errorMessage: err['message'],
              mainAxisAlignment: MainAxisAlignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
            ),
          );
        },
        loading: () {
          return const AppLoadingWidget();
        },
      ),
      bottomNavigationBar: asyncPost.when(
        data: (value) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(height: 0),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: ShareOpinion(
                  onTap: () async {
                    await context.push(
                      '/create/post/0',
                      extra: {
                        'rootPost': value.post,
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (error, st) {
          final err = error as Map<String, dynamic>;
          if (err['action'] == 'retry') {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: ContentSingleButton(
                onPressed: () {
                  ref.invalidate(postDetailProvider);
                },
                text: 'Retry',
                buttonIcon: Iconsax.refresh,
              ),
            );
          } else {
            return null;
          }
        },
        loading: () {
          return null;
        },
      ),
    );
  }
}
