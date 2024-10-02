import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/infinite_list.dart';
import 'package:civic_flutter/core/widgets/search_bar_widget.dart';
import 'package:civic_flutter/core/widgets/user_profile_image.dart';
// import 'package:civic_flutter/features/post/presentation/provider/post_list_provider.dart';
import 'package:civic_flutter/core/providers/tag_selections_provider.dart';
import 'package:civic_flutter/core/widgets/user_info_widget.dart';
import 'package:civic_flutter/core/providers/users_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:iconsax/iconsax.dart';

class TagUsersScreen extends ConsumerWidget {
  const TagUsersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final isDark = THelperFunctions.isDarkMode(context);
    final query = ref.watch(searchUsersListQueryProvider);
    final pagingController = ref.watch(usersListProvider(query).notifier);

    final queryProvider = ref.watch(searchUsersListQueryProvider.notifier);
    final tagState = ref.watch(tagSelectionsProvider);
    final tagProvider = ref.watch(tagSelectionsProvider.notifier);
    return AndroidBottomNav(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            75,
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: TSizes.sm - 2,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              child: AppBar(
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: SearchBarWidget(
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
                      onTap: tagState.isEmpty ? null : context.pop,
                      child: Container(
                        height: 25,
                        width: 25,
                        margin: const EdgeInsets.only(
                          left: TSizes.sm,
                        ),
                        decoration: BoxDecoration(
                          color: tagState.isEmpty
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
                avatar: UserProfileImage(
                  imageUrl: tagState[index].userInfo!.imageUrl!,
                ),
                label: Text(
                  tagState[index].userInfo!.fullName ??
                      tagState[index].userInfo!.userName!,
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
                onDeleted: () => tagProvider.removeUser(
                  tagState[index],
                ),
              );
            },
            separatorBuilder: (_, __) {
              return const SizedBox(
                width: TSizes.sm,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: tagState.length,
          ),
        ),
        body: InfiniteListWidget<UserRecord>(
          key: Key('tag_users_screen_$query'),
          pagingController: pagingController.pagingController,
          itemBuilder: (context, user, index) {
            final isSelected = tagState.contains(user);
            final itemLength =
                pagingController.pagingController.itemList!.length;
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
                  child: UserInfoWidget(
                    userRecord: user,
                    onTap: () {
                      if (isSelected) {
                        tagProvider.removeUser(user);
                      } else {
                        tagProvider.addUser(user);
                      }
                    },
                  ),
                ),
                if (index != itemLength - 1)
                  const Divider(
                    height: 0,
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
