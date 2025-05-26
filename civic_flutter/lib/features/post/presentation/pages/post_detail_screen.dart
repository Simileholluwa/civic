import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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
        data.hasValue ? data.value : null,
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
                    IconButton(
                      onPressed: () async {
                        await postCardNotifier.togglePostLikeStatus(
                          data.value!.id!,
                        );
                      },
                      icon: Icon(
                        postCardState.hasLiked ? Iconsax.heart5 : Iconsax.heart,
                        color: postCardState.hasLiked
                            ? TColors.primary
                            : Theme.of(context).iconTheme.color!,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        await postCardNotifier.togglePostBookmarkStatus(
                          id,
                        );
                      },
                      icon: Icon(
                        postCardState.hasBookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_add_outlined,
                        color: postCardState.hasBookmarked
                            ? TColors.primary
                            : Theme.of(context).iconTheme.color!,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        showModalBottomSheet(
                          context: context,
                          constraints: BoxConstraints(
                            maxHeight: postCardState.isOwner ? 180 : 370,
                          ),
                          builder: (ctx) {
                            return ShowPostActions(
                              post: data.value!,
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Iconsax.more_circle,
                        color: Theme.of(context).iconTheme.color!,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ]
                : [],
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
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  PostCardDetail(
                    post: data,
                    showInteractions: false,
                    hasProject: data.project != null,
                  ),
                  const SizedBox(height: 10,),
                  const Divider(),
                  const SizedBox(height: 10,),
                  const Divider(),
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
            return PostDetailBottomNavigation();
          }
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
