import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ShowPostActions extends ConsumerWidget {
  const ShowPostActions({
    required this.postWithUserState,
    required this.originalPostId,
    super.key,
    this.fromDetails = false,
    this.isReply = false,
    this.isComment = false,
    this.isPoll = false,
    this.isArticle = false,
  });

  final PostWithUserState postWithUserState;
  final bool fromDetails;
  final bool isPoll;
  final bool isReply;
  final bool isComment;
  final bool isArticle;
  final int originalPostId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = postWithUserState.post;
    final type = isReply
        ? 'reply'
        : isComment
            ? 'comment'
            : isPoll
                ? 'poll'
                : isArticle
                    ? 'article'
                    : 'post';
    final feedProv =
        feedButtonsProvider(PostWithUserStateKey(postWithUserState));
    final isFollower = ref.watch(feedProv.select((s) => s.isFollower));
    final postCardNotifier = ref.read(feedProv.notifier);

    final userId = ref.read(localStorageProvider).getInt('userId');
    final isOwner = post.ownerId == userId;
    final canEdit =
        isOwner && DateTime.now().difference(post.dateCreated!).inMinutes <= 30;
    final username = post.owner?.userInfo?.userName ?? 'User';

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'More actions',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.left,
              ),
              GestureDetector(
                onTap: context.pop,
                child: const Icon(
                  Icons.clear,
                  color: TColors.secondary,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 0),
        if (!isOwner)
          MoreActionsListTile(
            title: 'Not interested',
            subTitle: "I don't want to see this $type anymore.",
            icon: Iconsax.eye_slash,
            onTap: () async {
              if (context.mounted) {
                context.pop();
              }
              await context.push(
                '/feed/post/${post.id}/notInterested',
                extra: {
                  'postWithUserState': postWithUserState,
                  'originalPostId': originalPostId,
                },
              );
            },
          ),
        if (!isOwner)
          MoreActionsListTile(
            title: isFollower ? 'Unfollow' : 'Follow',
            subTitle: isFollower
                ? '$username will be removed from the list of people you follow.'
                : '$username will be added to the list of people you follow.',
            icon: isFollower ? Iconsax.user_remove : Iconsax.user_cirlce_add,
            onTap: () async {
              if (context.mounted) {
                context.pop();
              }
              await postCardNotifier.toggleFollow(
                post.ownerId,
                username,
              );
            },
          ),
        if (!isOwner)
          MoreActionsListTile(
            title: 'Report',
            subTitle: 'This $type is inappropriate or offensive.',
            icon: Iconsax.flag,
            color: Colors.red,
            onTap: () async {},
          ),
        if (canEdit)
          MoreActionsListTile(
            title: 'Edit',
            subTitle: 'You can change the content of this $type however, '
                'previous version(s) will be saved.',
            icon: Iconsax.edit,
            onTap: () async {
              context.pop();
              if (isPoll) {
                await context.push(
                  '/create/poll/${post.id}',
                  extra: {
                    'post': post,
                  },
                );
              } else if (isArticle) {
                await context.push(
                  '/create/article/${post.id}',
                  extra: {
                    'post': post,
                  },
                );
              } else {
                await context.push(
                  '/create/post/${post.id}',
                  extra: {
                    'post': post,
                    'project': post.project,
                    'parent': post.parent,
                  },
                );
              }
            },
          ),
        if (isOwner)
          MoreActionsListTile(
            title: 'Delete',
            subTitle:
                "Proceed with caution, deleted ${type == 'reply' ? 'replie' : type}s can not be undone!",
            icon: Iconsax.trash,
            color: Colors.red,
            onTap: () async {
              if (context.mounted) {
                context.pop();
              }
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
                  postId: post.id!,
                  kind: kind,
                  parentId: (isReply || isComment) ? originalPostId : null,
                ),
              );
            },
          ),
      ],
    );
  }
}
