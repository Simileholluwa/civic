import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/app_loading_widget.dart';
import 'package:civic_flutter/core/widgets/search_bar_widget.dart';
import 'package:civic_flutter/features/post/presentation/provider/tag_selections_provider.dart';
import 'package:civic_flutter/features/post/presentation/provider/tag_users_provider.dart';
import 'package:civic_flutter/core/widgets/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
// import 'package:iconsax/iconsax.dart';

class TagUsersScreen extends ConsumerWidget {
  const TagUsersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = THelperFunctions.isDarkMode(context);
    var data = ref.watch(tagSuggestionsProvider.future);
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
                leading: IconButton(
                  onPressed: context.pop,
                  icon: const Icon(
                    Icons.clear,
                  ),
                ),
                centerTitle: true,
                title: SearchBarWidget(
                onChanged: (text) {},
                hintText: 'Search for users',
              ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: TSizes.sm,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const SizedBox(),
        body: FutureBuilder(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return AppLoadingWidget(
                backgroundColor: isDark ? TColors.dark : TColors.light,
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  const Text(
                    'Something went wrong',
                  ),
                  TextButton(
                    onPressed: () async {
                      await ref
                          .read(tagSuggestionsProvider.notifier)
                          .loadSuggestions();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              );
            } else if (snapshot.data == null) {
              return const Text(
                'Could not fetch users',
              );
            } else {
              final users = snapshot.data!;
              return ListView.builder(
                itemCount: users.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final isSelected = tagState.contains(user);
                  return UserInfoWidget(
                    userRecord: user,
                    onTap: () {
                      if (isSelected) {
                        tagProvider.removeUser(user);
                      } else {
                        tagProvider.addUser(user);
                      }
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
