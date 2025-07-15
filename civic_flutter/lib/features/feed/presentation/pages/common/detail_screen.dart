import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DetailScreen extends ConsumerWidget {
  const DetailScreen({
    super.key,
    required this.id,
    required this.draftType,
    required this.postType,
    this.post,
  });

  final int id;
  final Post? post;
  final String draftType;
  final PostType postType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      postDetailProvider(id, draftType, post),
    );
    final livePost = ref.watch(
      postStreamProvider(
        id,
        data.value,
      ),
    );
    final newPost = livePost.value ?? data.value;
    final postCardState = ref.watch(
      feedButtonsProvider(
        newPost,
      ),
    );
    final postCardNotifier = ref.watch(
      feedButtonsProvider(
        newPost,
      ).notifier,
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
            actions: data.hasValue && !data.hasError
                ? [
                    IconButton(
                      onPressed: postCardState.isOwner
                          ? null
                          : () async {
                              await postCardNotifier.toggleFollow(
                                data.value!.ownerId,
                                data.value!.owner!.userInfo!.userName!,
                              );
                            },
                      icon: Icon(
                        postCardState.isFollower
                            ? Icons.person_remove_sharp
                            : Icons.person_add_sharp,
                        color: postCardState.isOwner
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).iconTheme.color,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: postCardState.isOwner
                          ? null
                          : () async {
                              await postCardNotifier.subscribeToNotifications(
                                data.value!.id!,
                              );
                            },
                      icon: Icon(
                        postCardState.isSubscribed
                            ? Iconsax.notification_bing5
                            : Iconsax.notification_bing,
                        color: postCardState.isOwner
                            ? Theme.of(context).disabledColor
                            : postCardState.isSubscribed
                                ? TColors.primary
                                : Theme.of(context).iconTheme.color,
                        size: 26,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ]
                : null,
          ),
        ),
      ),
      body: data.when(
        data: (value) {
          final likes = postCardState.numberOfLikes;
          final likesCount = newPost!.likedBy!.length;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                if (postType == PostType.regular)
                  PostCardDetail(
                    post: newPost,
                    showInteractions: false,
                    hasProject: newPost.project != null,
                    onTap: null,
                    noMaxLines: true,
                  ),
                if (postType == PostType.poll) PollDetailCard(newPost: newPost),
                if (postType == PostType.article)
                  ArticleDetailCard(
                    newPost: newPost,
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat('hh:mm a • MMM d, y')
                            .format(value.dateCreated!),
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context).hintColor,
                                ),
                      ),
                      if (likesCount > 0)
                        Text(
                          likesCount == 1 ? '$likes like' : '$likes likes',
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
                        post: newPost,
                      ),
                    ),
                    const Divider(
                      height: 0,
                    ),
                  ],
                ),
                if (newPost.postType == PostType.commentReply ||
                    newPost.postType == PostType.comment)
                  PostCommentReplyCard(
                    postId: value.id!,
                  ),
                if (newPost.postType == PostType.regular ||
                    newPost.postType == PostType.poll ||
                    newPost.postType == PostType.article ||
                    newPost.postType == PostType.projectRepost)
                  PostCommentCard(
                    id: value.id!,
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
              ],
            ),
          );
        },
        error: (error, st) {
          final err = error as Map<String, dynamic>;
          return Center(
            child: LoadingError(
              retry: null,
              errorMessage: err['message'] ?? 'Something went wrong',
              mainAxisAlignment: MainAxisAlignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
            ),
          );
        },
        loading: () {
          return AppLoadingWidget();
        },
      ),
      bottomNavigationBar: data.when(
        data: (value) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
            child: ContentSingleButton(
              text: 'Share your thoughts...',
              buttonIcon: Iconsax.pen_tool5,
              onPressed: () {
                context.push(
                  '/create/post/0',
                  extra: {
                    'parent': value,
                  },
                );
              },
            ),
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
                  ref.invalidate(
                    postDetailProvider,
                  );
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
