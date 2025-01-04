import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/features/feed/presentation/provider/feed_screen_provider.dart';
import 'package:civic_flutter/features/poll/presentation/pages/polls_screen.dart';
import 'package:civic_flutter/features/post/presentation/pages/posts_screen.dart';
import 'package:civic_flutter/features/feed/presentation/widgets/create_content_button.dart';
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
    final isDark = THelperFunctions.isDarkMode(context);
    if (sendPost != null) {
      Future.delayed(
        Duration.zero,
        () => sendPost!(),
      );
    }

    return Scaffold(
      appBar: AppBar(
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
        toolbarHeight: 65,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Container(
            margin: const EdgeInsets.only(
              top: 8,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).dividerColor,
                ),
              ),
            ),
            child: TabBar(
              controller: tabController,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              labelColor: isDark ? TColors.textWhite : TColors.dark,
              unselectedLabelColor:
                  isDark ? TColors.darkerGrey : TColors.darkGrey,
              
              unselectedLabelStyle:
                  Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
              labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
              indicatorColor: isDark ? TColors.textWhite : TColors.dark,
              indicatorWeight: 4,
              tabs: const [
                Tab(
                  text: 'POSTS',
                ),
                Tab(
                  text: 'POLLS',
                ),
                Tab(
                  text: 'ARTICLES',
                ),
                Tab(
                  text: 'VIDEOS',
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const CreateContentButton(),
      body: TabBarView(
        controller: tabController,
        children: [
          const PostsScreen(),
          const PollsScreen(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
