import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class TagUsersScreen extends ConsumerWidget {
  const TagUsersScreen({
    required this.post,
    super.key,
  });

  final Post post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchUsersListQueryProvider);
    final pagingController =
        ref.read(paginatedUsersListProvider(query).notifier);
    final queryProvider = ref.read(searchUsersListQueryProvider.notifier);
    final postState = ref.watch(postCreationProvider(post));
    final postNotifier = ref.read(postCreationProvider(post).notifier);
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            70,
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.only(
                bottom: TSizes.sm - 2,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              child: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: CreateContentSearchBar(
                  onChanged: (value) => queryProvider.setSearchQuery = value,
                  trailingWidget: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.refresh,
                      ),
                    ),
                    GestureDetector(
                      onTap: postState.taggedUsers.isEmpty ? null : context.pop,
                      child: Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.only(
                          left: TSizes.sm,
                        ),
                        decoration: BoxDecoration(
                          color: postState.taggedUsers.isEmpty
                              ? Theme.of(context).disabledColor
                              : TColors.primary,
                          borderRadius: BorderRadius.circular(
                            TSizes.xs,
                          ),
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                  hintText: 'Tap here to search for users',
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.md,
            ),
            itemBuilder: (context, index) {
              return Chip(
                avatar: AppUserProfileImage(
                  imageUrl: postState.taggedUsers[index].userInfo!.imageUrl!,
                  radius: 13,
                  iconSize: 23,
                ),
                label: Text(
                  postState.taggedUsers[index].userInfo!.fullName ??
                      postState.taggedUsers[index].userInfo!.userName!,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                elevation: 0,
                surfaceTintColor: Colors.transparent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                ),
                backgroundColor: Colors.transparent,
                deleteIcon: const Icon(
                  Icons.clear,
                  color: TColors.secondary,
                ),
                onDeleted: () => postNotifier.removeUser(
                  postState.taggedUsers[index],
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: TSizes.sm,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: postState.taggedUsers.length,
          ),
        ),
        body: AppInfiniteList<UserRecord>(
          key: Key('post_tag_users_screen_$query'),
          pagingController: pagingController.pagingController,
          canCreate: false,
          itemBuilder: (context, user, index) {
            final isSelected = postState.taggedUsers.contains(user);
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 3 : TSizes.sm,
                    bottom: TSizes.sm,
                  ),
                  color: isSelected
                      ? TColors.primary.withAlpha(
                          30,
                        )
                      : null,
                  child: AppUserInfoWidget(
                    userRecord: user,
                    onTap: () {
                      if (isSelected) {
                        postNotifier.removeUser(user);
                      } else {
                        postNotifier.addUser(user);
                      }
                    },
                  ),
                ),
              ],
            );
          },
          onRefresh: pagingController.refresh,
        ),
      ),
    );
  }
}
