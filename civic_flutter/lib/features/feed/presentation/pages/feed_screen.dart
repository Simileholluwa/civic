import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({
    super.key,
    this.tabName,
  });
  final String? tabName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(
      feedPageControllerProvider(
        tabName,
      ),
    );
    final pageControllerNotifier = ref.watch(
      feedPageControllerProvider(
        tabName,
      ).notifier,
    );
    final currentPageNotifier = ref.watch(
      feedCurrentPageProvider(
        tabName,
      ).notifier,
    );
    final currentPageState = ref.watch(
      feedCurrentPageProvider(
        tabName,
      ),
    );
    return Scaffold(
      appBar: ContentAppBar(
        isVisible: true,
        leading: IconButton(
          icon: const Icon(
            Icons.apps,
            size: 30,
          ),
          onPressed: () {},
        ),
        titleSpacing: 0,
        bottomHeight: 30,
        centerTitle: true,
        title: Text(
          'CIVIC',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor,
              ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 15,
                  children: [
                    ...['PROJECTS', 'POSTS', 'POLLS', 'ARTICLES']
                        .asMap()
                        .entries
                        .map(
                      (filter) {
                        final text = filter.value;
                        final index = filter.key;
                        return GestureDetector(
                          onTap: () {
                            pageControllerNotifier.gotoPage(
                              index,
                            );
                          },
                          child: Text(
                            text,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: currentPageState == index
                                      ? Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .color
                                      : Theme.of(context).hintColor,
                                  fontWeight: currentPageState == index
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  fontSize: 15,
                                ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Iconsax.filter5,
              size: 26,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {
              if (currentPageState == 0) {
                ref.watch(projectScreenWidgetsProvider.notifier).toggleFilter();
              }
            },
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index) {
              currentPageNotifier.setCurrentPage(index);
            },
            physics: const ClampingScrollPhysics(),
            children: [
              ContentKeepAliveWrapper(
                child: const ProjectsScreen(),
              ),
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
