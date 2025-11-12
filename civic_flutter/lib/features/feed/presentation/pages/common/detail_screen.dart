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
    final data = ref.watch(
      postDetailProvider(id, post, postType),
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
                              await postCardNotifier.subscribeToNotifications(
                                data.value!.id!,
                              );
                            },
                      icon: Icon(
                        postCardState.isSubscribed
                            ? Iconsax.notification5
                            : Iconsax.notification,
                        color: postCardState.isOwner
                            ? Theme.of(context).disabledColor
                            : postCardState.isSubscribed
                                ? TColors.primary
                                : Theme.of(context).iconTheme.color,
                        size: 30,
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
          final likesCount = newPost!.likesCount!;
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
      bottomNavigationBar: data.when(
        data: (value) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(height: 0),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
                child: ShareOpinion(
                  imageUrl: value.owner!.userInfo!.imageUrl!,
                  onTap: () async {
                    await context.push(
                      '/create/post/0',
                      extra: {
                        'parent': value,
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
