import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class PostDetailScreen extends ConsumerWidget {
  const PostDetailScreen({
    super.key,
    required this.id,
    this.post,
  });

  final int id;
  final Post? post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isVisibleNotifier = ref.read(
      appBottomNavigationVisibilityProvider(
        null,
      ).notifier,
    );
    Future.delayed(
      Duration.zero,
      () => isVisibleNotifier.hide(),
    );
    final data = post == null
        ? ref.watch(
            postDetailProvider(
              id,
            ),
          )
        : AsyncValue.data(
            post,
          );
    final postCardState = ref.watch(
      postCardWidgetProvider(
        data.hasValue ? data.value : null,
      ),
    );
    final postCardNotifier = ref.watch(
      postCardWidgetProvider(
        post,
      ).notifier,
    );
    final userNotifier = ref.watch(
      currentActiveUserProvider.notifier,
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
                          final result = await userNotifier.toggleFollow(
                            data.value!.ownerId,
                          );

                          if (result) {
                            postCardNotifier.setIsFollower();
                            if (!postCardState.isFollower) {
                              TToastMessages.infoToast(
                                'You are now following ${data.value!.owner!.userInfo!.userName}',
                              );
                            } else {
                              TToastMessages.infoToast(
                                'You are no longer following ${data.value!.owner!.userInfo!.userName}',
                              );
                            }
                          }
                        },
                        icon: Icon(
                          postCardState.isFollower
                              ? Icons.person_remove_alt_1_rounded
                              : Icons.person_add_alt_rounded,
                          size: 27,
                          color: !postCardState.isFollower ? TColors.primary: null,
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
        data: (data) {
          if (data == null) {
            return const Center(
              child: Text('Post not found'),
            );
          } else {
            final likes = postCardState.numberOfLikes;
            final likesCount = data.likedBy!.length;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  PostCardDetail(
                    post: data,
                    showInteractions: false,
                    hasProject: data.project != null,
                    onTap: null,
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
                              .format(data.dateCreated!),
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    color: Theme.of(context).hintColor,
                                  ),
                        ),
                        if (likesCount > 0)
                          Text(
                            likesCount == 1
                                ? '$likes like'
                                : '$likes likes',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: Theme.of(context).hintColor,
                                ),
                          ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: PostDetailOptions(
                      post: data,
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  PostCommentCard(
                    postId: data.id!,
                  ),
                ],
              ),
            );
          }
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
        data: (data) {
          if (data == null) {
            return null;
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ContentSingleButton(
                onPressed: () {},
                text: 'Share your opinion',
                buttonIcon: Iconsax.magicpen5,
              ),
            );
            // return PostDetailBottomNavigation();
          }
        },
        error: (error, st) {
          final err = error as Map<String, dynamic>;
          if (err['action'] == 'retry') {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: ContentSingleButton(
                onPressed: () {
                  ref.invalidate(
                    postDetailProvider(
                      id,
                    ),
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
