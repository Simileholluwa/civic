import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class PollTagUsersScreen extends ConsumerWidget {
  const PollTagUsersScreen({
    super.key,
    required this.poll,
  });

  final Poll poll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(searchUsersListQueryProvider);
    final pagingController = ref.watch(paginatedUsersListProvider(query).notifier);
    final queryProvider = ref.watch(searchUsersListQueryProvider.notifier);
    final pollState = ref.watch(pollsOptionsProvider(poll));
    final pollNotifier = ref.watch(pollsOptionsProvider(poll).notifier);
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
                  onChanged: (text) {
                    queryProvider.setSearchQuery(
                      text,
                    );
                  },
                  trailingWidget: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Iconsax.refresh,
                      ),
                    ),
                    GestureDetector(
                      onTap: pollState.taggedUsers.isEmpty ? null : context.pop,
                      child: Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.only(
                          left: TSizes.sm,
                        ),
                        decoration: BoxDecoration(
                          color: pollState.taggedUsers.isEmpty
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
                  hintText: 'Search for users',
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
                  imageUrl: pollState.taggedUsers[index].userInfo!.imageUrl!,
                ),
                label: Text(
                  pollState.taggedUsers[index].userInfo!.fullName ??
                      pollState.taggedUsers[index].userInfo!.userName!,
                  style: Theme.of(context).textTheme.labelMedium!,
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
                onDeleted: () => pollNotifier.removeUser(
                  pollState.taggedUsers[index],
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: TSizes.sm,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: pollState.taggedUsers.length,
          ),
        ),
        body: AppInfiniteList<UserRecord>(
          key: Key('tag_users_screen_$query'),
          pagingController: pagingController.pagingController,
          itemBuilder: (context, user, index) {
            final isSelected = pollState.taggedUsers.contains(user);
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
                        pollNotifier.removeUser(user);
                      } else {
                        pollNotifier.addUser(user);
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
