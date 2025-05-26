import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ShowPostActions extends ConsumerWidget {
  const ShowPostActions({
    super.key,
    required this.post,
    this.fromDetails = false,
  });

  final Post post;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.watch(currentActiveUserProvider.notifier);
    final postCardState = ref.watch(
      postCardWidgetProvider(
        post,
      ),
    );
    final postCardNotifier = ref.watch(
      postCardWidgetProvider(
        post,
      ).notifier,
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: Container(
          margin: EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: AppBar(
            titleSpacing: 4,
            title: Text(
              'More actions',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 20,
                  ),
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Iconsax.copy),
            title: Text(
              'Copy link',
            ),
            onTap: () {},
          ),
          if (!postCardState.isOwner)
            ListTile(
              leading: Icon(Iconsax.eye_slash),
              title: Text(
                'Not interested',
              ),
              onTap: () async {
                if (context.mounted) {
                  context.pop();
                  if (fromDetails) {
                    context.pop();
                  }
                }
                final result = await postCardNotifier.markPostNotInterested(
                  post.id!,
                );
                if (result) {
                  TToastMessages.infoToast(
                    'You will no longer see this post in your feed',
                  );
                }
              },
            ),
          if (!postCardState.isOwner)
            ListTile(
              leading: Icon(
                Iconsax.flag,
                color: Colors.red,
              ),
              title: Text(
                'Report',
                style: TextStyle().copyWith(
                  color: Colors.red,
                ),
              ),
              onTap: () {},
            ),
          if (postCardState.isOwner)
            ListTile(
              leading: Icon(
                Iconsax.trash,
                color: Colors.red,
              ),
              title: Text(
                'Delete',
                style: TextStyle().copyWith(
                  color: Colors.red,
                ),
              ),
              onTap: () async {
                if (context.mounted) {
                  context.pop();
                }
                await PostHelperFunctions.deletePostDialog(
                  context,
                  postCardNotifier,
                  post.id!,
                );

                if (context.mounted) {
                  context.pop();
                }
              },
            ),
          if (!postCardState.isOwner)
            const Divider(
              indent: 20,
              endIndent: 30,
            ),
          if (!postCardState.isOwner)
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    postCardState.isFollower
                        ? Iconsax.user_remove
                        : Iconsax.user_cirlce_add,
                  ),
                  title: Text(
                    postCardState.isFollower ? 'Unfollow' : 'Follow',
                  ),
                  onTap: () async {
                    if (context.mounted) {
                      context.pop();
                    }
                    final result = await userNotifier.toggleFollow(
                      post.ownerId,
                    );

                    if (result) {
                      postCardNotifier.setIsFollower();
                      if (!postCardState.isFollower) {
                        TToastMessages.infoToast(
                          'You are now following ${post.owner!.userInfo!.userName}',
                        );
                      } else {
                        TToastMessages.infoToast(
                          'You are no longer following ${post.owner!.userInfo!.userName}',
                        );
                      }
                    }
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.block_sharp,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Block',
                    style: TextStyle().copyWith(
                      color: Colors.red,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
        ],
      ),
    );
  }
}
