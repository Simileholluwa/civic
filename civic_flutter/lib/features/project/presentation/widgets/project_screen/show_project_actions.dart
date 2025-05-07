import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:civic_flutter/features/user/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ShowProjectActions extends ConsumerWidget {
  const ShowProjectActions({
    super.key,
    required this.project,
    required this.projectCardNotifier,
    this.fromDetails = false,
  });

  final Project project;
  final ProjectCardWidget projectCardNotifier;
  final bool fromDetails;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.watch(currentActiveUserProvider.notifier);
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        project,
      ),
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
          if (projectCardState.canVet! && !projectCardState.isOwner!)
            ListTile(
              leading: Icon(
                projectCardState.isBookmarked!
                    ? Icons.bookmark
                    : Icons.bookmark_add_outlined,
              ),
              title: Text(
                projectCardState.isBookmarked! ? 'Remove Bookmark' : 'Bookmark',
              ),
              onTap: () async {
                if (context.mounted) {
                  context.pop();
                }
                final result = await projectCardNotifier.toggleBookmarkStatus(
                  project.id!,
                );
                if (result) {
                  if (!projectCardState.isBookmarked!) {
                    TToastMessages.infoToast('Project has been bookmarked');
                  } else {
                    TToastMessages.infoToast(
                        'Project has been removed from bookmarks');
                  }
                }
              },
            ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              'Share',
            ),
            trailing: Icon(
              Iconsax.arrow_right_3,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Iconsax.copy),
            title: Text(
              'Copy link',
            ),
            onTap: () {},
          ),
          if (!projectCardState.isOwner!)
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
                final result =
                    await projectCardNotifier.markProjectNotInterested(
                  project.id!,
                );
                if (result) {
                  TToastMessages.infoToast(
                    'You will no longer see this project in your feed',
                  );
                }
              },
            ),
          if (!projectCardState.isOwner!)
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
          if (projectCardState.isOwner!)
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
                ProjectHelperFunctions.deleteProjectBottomSheet(
                  context,
                  project,
                );
              },
            ),
          if (!projectCardState.isOwner!)
            const Divider(
              indent: 20,
              endIndent: 30,
            ),
          if (!projectCardState.isOwner!)
            Column(
              children: [
                ListTile(
                  leading: Icon(
                    projectCardState.isFollower!
                        ? Iconsax.user_remove
                        : Iconsax.user_cirlce_add,
                  ),
                  title: Text(
                    projectCardState.isFollower! ? 'Unfollow' : 'Follow',
                  ),
                  onTap: () async {
                    if (context.mounted) {
                      context.pop();
                    }
                    final result = await userNotifier.toggleFollow(
                      project.ownerId,
                    );

                    if (result) {
                      projectCardNotifier.setIsFollower();
                      if (!projectCardState.isFollower!) {
                        TToastMessages.infoToast(
                          'You are now following ${project.owner!.userInfo!.userName}',
                        );
                      } else {
                        TToastMessages.infoToast(
                          'You are no longer following ${project.owner!.userInfo!.userName}',
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
