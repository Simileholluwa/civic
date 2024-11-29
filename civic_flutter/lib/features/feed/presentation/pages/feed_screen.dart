import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/feed/presentation/widgets/create_content_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({
    required this.sendPost,
    super.key,
  });
  final VoidCallback? sendPost;

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    if (widget.sendPost != null) {
      Future.delayed(
        Duration.zero,
        () => widget.sendPost!(),
      );
    }
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CIVIC',
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: TColors.primary,
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TabBar(
            controller: _tabController,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelColor: isDark ? TColors.textWhite : TColors.dark,
            unselectedLabelColor:
                isDark ? TColors.darkerGrey : TColors.darkGrey,
            padding: const EdgeInsets.only(
              left: TSizes.xs - 1,
            ),
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
                text: 'ALL',
              ),
              Tab(
                text: 'POLLS',
              ),
              Tab(
                text: 'TOWNHALLS',
              ),
              Tab(
                text: 'ARTICLES',
              ),
              Tab(
                text: 'LIVE',
              ),
              Tab(
                text: 'TRENDING',
              ),
              Tab(
                text: 'RECENT',
              ),
              Tab(
                text: 'VIDEOS',
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: TSizes.md,
            ),
            child: CircleAvatar(
              radius: 16,
              backgroundColor: TColors.primary,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://civic-development.s3.eu-north-1.amazonaws.com/20231203_003323.jpg',
                  fit: BoxFit.cover,
                  height: 32,
                  width: 32,
                  errorWidget: (context, url, child) {
                    return const Icon(
                      CupertinoIcons.person_alt_circle_fill,
                      size: 34,
                    );
                  },
                  progressIndicatorBuilder: (context, url, progress) {
                    return const Center(
                      child: Icon(
                        CupertinoIcons.person_alt_circle_fill,
                        size: 34,
                        color: TColors.textWhite,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: const CreateContentButton(),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                ref.read(authProvider.notifier).logout(context);
              },
              child: const Text('Logout'),
            ),
          ),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
