import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PostDetailScreen extends ConsumerWidget {
  const PostDetailScreen({
    super.key,
    required this.id,
    this.postType = PostType.regular,
    this.post,
  });

  final int id;
  final PostType postType;
  final Post? post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      postDetailProvider(id, 'postDraft', post),
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
            title: Text(
              data.hasValue && !data.hasError
                  ? "${data.value?.owner?.userInfo?.userName}'s Post"
                  : 'Post',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 25,
                  ),
            ),
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
                    if (!postCardState.isOwner)
                      IconButton(
                        onPressed: () async {
                          await postCardNotifier.toggleFollow(
                            data.value!.ownerId,
                            data.value!.owner!.userInfo!.userName!,
                          );
                        },
                        icon: Icon(
                          postCardState.isFollower
                              ? Icons.person_remove_sharp
                              : Icons.person_add_sharp,
                          color: !postCardState.isFollower
                              ? TColors.primary
                              : null,
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
          final likesCount = newPost!.likedBy!.length;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                PostCardDetail(
                  post: newPost,
                  showInteractions: false,
                  hasProject: newPost.project != null,
                  onTap: null,
                  noMaxLines: true,
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
                PostCommentCard(
                  postId: value.id!,
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ContentSingleButton(
              onPressed: () {
                context.push('/create/post/0', extra: {
                  'parent': value,
                });
              },
              text: 'Share your opinion',
              buttonIcon: Iconsax.magicpen5,
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
