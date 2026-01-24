import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PostDetailOptions extends ConsumerWidget {
  const PostDetailOptions({
    required this.postWithUserState,
    super.key,
    this.isPoll = false,
    this.isArticle = false,
    this.isReply = false,
    this.isComment = false,
  });

  final PostWithUserState postWithUserState;
  final bool isPoll;
  final bool isArticle;
  final bool isReply;
  final bool isComment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final feedProv =
        feedButtonsProvider(PostWithUserStateKey(postWithUserState));
    final post = postWithUserState.post;
    final hasLiked = ref.watch(
      feedProv.select(
        (s) => s.hasLiked,
      ),
    );
    final hasBookmarked = ref.watch(
      feedProv.select(
        (s) => s.hasBookmarked,
      ),
    );
    final postCardNotifier = ref.read(feedProv.notifier);
    final userId = ref.read(localStorageProvider).getInt('userId');
    final isOwner = post.ownerId == userId;
    final canEdit = isOwner &&
        DateTime.now()
                .difference(
                  post.dateCreated!,
                )
                .inMinutes <=
            1000000000;

    return RepaintBoundary(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () async {
              final id = post.id;
              if (id == null) return;
              await postCardNotifier.togglePostLikeStatus(id);
            },
            icon: Icon(
              hasLiked ? Iconsax.heart5 : Iconsax.heart,
              color: hasLiked
                  ? TColors.primary
                  : Theme.of(context).iconTheme.color!,
            ),
          ),
          IconButton(
            onPressed: () async {
              final id = post.id;
              if (id == null) return;
              await postCardNotifier.togglePostBookmarkStatus(
                id,
                hasBookmarked,
              );
            },
            icon: Icon(
              hasBookmarked ? Icons.bookmark : Icons.bookmark_add_outlined,
              color: hasBookmarked
                  ? TColors.primary
                  : Theme.of(context).iconTheme.color!,
            ),
          ),
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.share),
          ),
          if (canEdit)
            IconButton(
              onPressed: () async {
                final id = post.id;
                if (id == null) return;
                if (isPoll) {
                  await context.push(
                    '/create/poll/$id',
                    extra: {
                      'post': post,
                    },
                  );
                } else if (isArticle) {
                  await context.push(
                    '/create/article/$id',
                    extra: {
                      'post': post,
                    },
                  );
                } else {
                  await context.push(
                    '/create/post/$id',
                    extra: {
                      'post': post,
                      'project': post.project,
                    },
                  );
                }
              },
              icon: const Icon(Iconsax.edit),
            ),
          if (!isOwner)
            IconButton(
              onPressed: () async {
                final id = post.id;
                if (id == null) return;
                await context.push(
                  '/feed/post/$id/notInterested',
                  extra: {
                    'postWithUserState': postWithUserState,
                    'originalPostId': id,
                  },
                );
              },
              icon: const Icon(Iconsax.eye_slash),
            ),
          if (isOwner)
            IconButton(
              onPressed: () async {
                final id = post.id;
                if (id == null) return;
                final result = await FeedHelperFunctions.deletePostDialog(
                  context,
                );
                if (result ?? false) {
                  final kind = isReply
                      ? PostKind.reply
                      : isComment
                          ? PostKind.comment
                          : isPoll
                              ? PostKind.poll
                              : isArticle
                                  ? PostKind.article
                                  : PostKind.post;
                  await postCardNotifier.deletePost(
                    DeleteContext(
                      postId: id,
                      kind: kind,
                      parentId: (isReply || isComment) ? id : null,
                    ),
                  );
                }
              },
              icon: const Icon(
                Iconsax.trash,
                color: Colors.red,
              ),
            ),
          if (!isOwner)
            IconButton(
              onPressed: () async {},
              icon: const Icon(
                Iconsax.flag,
                color: Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
