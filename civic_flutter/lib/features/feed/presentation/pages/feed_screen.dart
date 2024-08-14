import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

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
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.search_normal,
              size: 30,
            ),
          ),
          const SizedBox(
            width: TSizes.md,
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: TSizes.md,
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: isDark ? TColors.dark : TColors.light,
              child: CachedNetworkImage(
                imageUrl: '',
                errorWidget: (context, url, child) {
                  return const Icon(
                    CupertinoIcons.person_alt_circle_fill,
                    size: 37,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(),
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
