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
    final tabController = ref.watch(
      feedScreenTabControllerProvider,
    );
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 60,
              floating: true,
              snap: true,
              actions: [
                IconButton(
                  onPressed: () {
                    context.push('/feed/bookmarks');
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
                const SizedBox(width: 5,),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 22, left: 1),
                    child: AppDecorationDot(),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(65),
                child: FeedBottomWidget(),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            ContentKeepAliveWrapper(
              child: const PostsScreen(),
            ),
            ContentKeepAliveWrapper(
              child: const PollsScreen(),
            ),
            ContentKeepAliveWrapper(
              child: const ArticlesScreen(),
            )
          ],
        ),
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
        Container(
          margin: const EdgeInsets.fromLTRB(13, 0, 15, 15),
          padding: const EdgeInsets.all(
            5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              100,
            ),
            color: Theme.of(context).cardColor,
            border: Border.all(
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: AppTabBarDesign(
            height: 35,
            tabController: tabController,
            dividerColor: Colors.transparent,
            tabAlignment: TabAlignment.fill,
            isScrollable: false,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(100),
            ),
            activeColor: Colors.white,
            tabs: [
              Tab(
                text: 'POSTS',
              ),
              Tab(text: 'POLLS'),
              Tab(text: 'ARTICLES'),
            ],
          ),
        ),
        const Divider(
          height: 0,
        ),
      ],
    );
  }
}
