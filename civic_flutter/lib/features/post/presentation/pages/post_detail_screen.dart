import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/post/presentation/widgets/post_comment_tree.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PostDetailScreen extends ConsumerWidget {
  const PostDetailScreen({
    super.key,
    required this.id,
  });

  final int id;

  static String routePath([int? id]) => 'posts/${id ?? ':id'}';
  static String routeName() => 'posts/details';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      postDetailProvider(
        null,
        id,
      ),
    );
    final commentPagingControllerNotifier = ref.watch(
      paginatedPostCommentListProvider(id).notifier,
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
            title: Text('Post'),
            leading: IconButton(
              icon: const Icon(
                Iconsax.arrow_left_2,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Iconsax.sort,
                  size: 26,
                ),
                onPressed: () {},
              ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
      body: data.when(
        data: (post) {
          if (post == null) {
            return const Center(
              child: Text(
                'Post not found',
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                  child: PostCard(
                    onTap: null,
                    post: post,
                    noMaxLines: true,
                  ),
                ),
                AppInfiniteList<PostComment>(
                  pagingController:
                      commentPagingControllerNotifier.pagingController,
                  scrollPhysics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, postComment, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          if (index == 0)
                            const SizedBox(height: 5)
                          else
                            const SizedBox(height: 10),
                          PostCommentTreeWidget(
                            commentId: postComment.id!,
                            postId: post.id!,
                            postComment,
                            postComment.replyBy?.isNotEmpty ?? false,
                            contentRoot: (context, comment) {
                              return PostCommentAndReplyContent(
                                replyOrComment: comment,
                                onReply: () async {
                                  final saveReply = ref.read(
                                    savePostCommentProvider,
                                  );
                                  final result = await saveReply(
                                    SavePostCommentParams(
                                      post.id!,
                                      PostComment(
                                        postId: post.id!,
                                        ownerId: post.ownerId,
                                        text:
                                            'Hello there, I am excited to make this reply again and again!',
                                        parentId: postComment.id,
                                      ),
                                    ),
                                  );
                                  result.fold(
                                    (l) {
                                      log(l.message);
                                    },
                                    (r) {
                                      if (r != null) {
                                        ref
                                            .read(postCommentRepliesProvider
                                                .notifier)
                                            .addReply(
                                              postComment.id!,
                                              r,
                                            );
                                      }
                                    },
                                  );
                                },
                              );
                            },
                            contentChild: (context, reply) {
                              return PostCommentAndReplyContent(
                                replyOrComment: reply,
                                isReply: true,
                              );
                            },
                          ),
                          if (postComment.replyBy?.isEmpty ?? false)
                            const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                  onRefresh: () => commentPagingControllerNotifier.refresh(),
                  noItemsFound: ContentNoItemsFound(),
                ),
              ],
            ),
          );
        },
        error: (error, st) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () {
          return AppLoadingWidget(
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          bottom: TSizes.xs,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 150,
                  ),
                  child: TextFormField(
                    controller: TextEditingController(),
                    maxLines: null,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      hintText: 'Share your opinion...',
                      errorStyle:
                          Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).hintColor,
                              ),
                      errorMaxLines: 2,
                      contentPadding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                      hintMaxLines: 1,
                    ),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentNoItemsFound extends StatelessWidget {
  const ContentNoItemsFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Iconsax.messages,
            size: 50,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Be the first to share your opinion!",
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class PostCommentAndReplyContent extends StatelessWidget {
  const PostCommentAndReplyContent({
    super.key,
    required this.replyOrComment,
    this.onReply,
    this.onLike,
    this.isReply = false,
  });

  final PostComment replyOrComment;
  final VoidCallback? onReply;
  final VoidCallback? onLike;
  final bool isReply;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isReply)
          CreatorNameAndAccountInfo(
            creator: replyOrComment.owner!,
            timeAgo: THelperFunctions.humanizeDateTime(
              replyOrComment.dateCreated ?? DateTime.now(),
            ),
          ),
        if (replyOrComment.text != null)
          ContentExpandableText(
            text: replyOrComment.text!,
            noMaxLines: true,
          ),
        if (replyOrComment.imageUrls?.isNotEmpty ?? false)
          replyOrComment.imageUrls!.length == 1
              ? ContentSingleCachedImage(
                  imageUrl: replyOrComment.imageUrls!.first,
                  useMargin: false,
                )
              : ContentMultipleCachedImage(
                  imageUrls: replyOrComment.imageUrls!,
                  useMargin: false,
                ),
        Row(
          spacing: 10,
          children: [
            GestureDetector(
              onTap: onLike,
              child: Text(
                'Like',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
            const Text('•'),
            GestureDetector(
              onTap: onReply,
              child: Text(
                'Reply',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
