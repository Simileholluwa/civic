import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/features/feed/presentation/provider/feed_screen_provider.dart';
import 'package:civic_flutter/features/feed/presentation/widgets/create_content_button.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        title: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
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
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
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
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list_rounded,
              size: 32,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const CreateContentButton(),
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
