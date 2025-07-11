import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPageState = ref.watch(
      feedCurrentPageProvider,
    );
    final tabController = ref.watch(
      feedScreenTabControllerProvider,
    );
    final isVisible = ref.watch(
      appScrollVisibilityProvider(
        true,
      ),
    );
    return Scaffold(
      appBar: ContentAppBar(
        isVisible: isVisible,
        leading: IconButton(
          icon: const Icon(
            Icons.apps,
            size: 30,
          ),
          onPressed: () {},
        ),
        titleSpacing: 0,
        centerTitle: true,
        bottomHeight: 54,
        title: const SizedBox(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppTabBarDesign(
            dividerColor: Colors.transparent,
            tabController: tabController,
            showTopBorder: true,
            tabs: [
              Tab(text: 'POSTS'),
              Tab(text: 'POLLS'),
              Tab(text: 'ARTICLES'),
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
      body: Stack(
        children: [
          TabBarView(
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
          if (currentPageState == 0) ProjectFilterOverlay(),
        ],
      ),
    );
  }
}
