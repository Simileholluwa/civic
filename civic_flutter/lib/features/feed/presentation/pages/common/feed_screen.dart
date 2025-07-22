import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
      drawer: AppDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 60,
              floating: true,
              snap: true,
              
              leading: IconButton(
                icon: const Icon(
                  Icons.apps,
                  size: 30,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(65),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      spacing: 10,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
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
                        ),
                        Container(
                          height: 46,
                          width: 46,
                          margin: const EdgeInsets.only(right: 15, bottom: 13),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Iconsax.filter,
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      height: 0,
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Iconsax.search_normal,
                    size: 26,
                  ),
                  onPressed: () {},
                ),
                const SizedBox(width: 5),
              ],
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

class SliverDelegate extends SliverPersistentHeaderDelegate {
  SliverDelegate({required this.tabController});

  final TabController tabController;

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: AppTabBarDesign(
        dividerColor: Theme.of(context).dividerColor,
        tabController: tabController,
        showTopBorder: true,
        tabs: [
          Tab(text: 'POSTS'),
          Tab(text: 'POLLS'),
          Tab(text: 'ARTICLES'),
        ],
      ),
    );
  }
}
