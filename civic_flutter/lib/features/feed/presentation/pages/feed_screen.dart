import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
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
    final tabController = ref.watch(feedScreenTabProvider);
    final isVisible = ref.watch(appScrollVisibilityProvider);
    if (sendPost != null) {
      Future.delayed(
        Duration.zero,
        () => sendPost!(),
      );
    }

    return Scaffold(
      appBar: ContentAppBar(
        isVisible: isVisible,
        title: Text(
          'Feed',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.search_normal,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.filter,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.send_square,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.setting_2,
            ),
          ),
          const SizedBox(width: 5),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            decoration: !isVisible
                ? null
                : BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
            margin: EdgeInsets.only(top: !isVisible ? 1 : 0),
            child: AppTabBarDesign(
              tabController: tabController,
              tabs: [
                ...['POSTS', 'POLLS', 'ARTICLES'].map(
                  (filter) {
                    return Tab(
                      text: filter,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        bottomHeight: 52,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const CreateContentButton(),
      body: TabBarView(
        controller: tabController,
        children: [
          const PostsScreen(),
          const PollsScreen(),
          Container(),
        ],
      ),
    );
  }
}
