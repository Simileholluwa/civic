import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/article/article.dart';
import 'package:civic_flutter/features/feed/presentation/provider/feed_screen_provider.dart';
import 'package:civic_flutter/features/feed/presentation/widgets/create_content_button.dart';
import 'package:civic_flutter/features/poll/poll.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({
    required this.sendPost,
    super.key,
  });
  final VoidCallback? sendPost;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (sendPost != null) {
      Future.delayed(
        Duration.zero,
        () => sendPost!(),
      );
    }
    final pageController = ref.watch(feedPageControllerProvider);
    final pageControllerNotifier =
        ref.watch(feedPageControllerProvider.notifier);
    final currentPageNotifier = ref.watch(feedCurrentPageProvider.notifier);
    final currentPageState = ref.watch(feedCurrentPageProvider);
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
        titleSpacing: 2,
        title: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 15,
            children: [
              ...['POSTS', 'POLLS', 'ARTICLES'].asMap().entries.map(
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
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: currentPageState == index
                                ? Theme.of(context).textTheme.labelMedium!.color
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
        actions: [
          IconButton(
            icon: const Icon(
              Icons.filter_list_rounded,
              size: 30,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Iconsax.notification5,
              size: 26,
            ),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const CreateContentButton(),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          currentPageNotifier.setCurrentPage(index);
        },
        physics: const ClampingScrollPhysics(),
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
    );
  }
}
