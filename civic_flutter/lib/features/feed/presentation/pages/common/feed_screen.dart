import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              actions: [
                IconButton(
                  onPressed: () async {
                    await context.push('/feed/bookmarks');
                  },
                  icon: const Icon(
                    Iconsax.note_1,
                    size: 26,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.search_normal,
                    size: 26,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.setting_3,
                    size: 26,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'SOCIAL',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 25,
                        ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 22, left: 1),
                    child: AppDecorationDot(),
                  ),
                ],
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(5),
                child: Divider(
                  height: 0,
                ),
              ),
            ),
          ];
        },
        body: const PostsScreen(),
      ),
    );
  }
}

class FeedBottomWidget extends ConsumerWidget {
  const FeedBottomWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(
      feedScreenTabControllerProvider,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppTabBarDesign(
          tabController: tabController,
          showTopBorder: true,
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(
              text: 'POSTS',
            ),
            Tab(text: 'POLLS'),
            Tab(text: 'ARTICLES'),
          ],
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
