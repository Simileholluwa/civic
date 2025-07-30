import 'dart:convert';
import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(
      projectTabControllerProvider,
    );
    final savedRecordString = ref
        .read(
          localStorageProvider,
        )
        .getString(
          'userRecord',
        );
    final decoded = jsonDecode(savedRecordString.toString());
    final userRecord = UserRecord.fromJson(decoded);
    final isLeader = userRecord.politicalStatus!.index != 3;
    final width = MediaQuery.sizeOf(context).width;
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
                    context.push(
                      '/project/bookmarks',
                    );
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
                    'PROJECTS',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 25,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21, left: 1),
                    child: AppDecorationDot(),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(65),
                child: Column(
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
                        tabAlignment: width > 450
                            ? TabAlignment.fill : TabAlignment.start,
                        isScrollable: width > 450 ? false : true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        activeColor: Colors.white,
                        tabs: [
                          Tab(text: 'ALL PROJECTS'),
                          Tab(text: 'NEW'),
                          Tab(text: 'TRENDING'),
                          Tab(text: 'TOP RATINGS'),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 0,
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            ProjectsInfiniteList(
              sortBy: '',
              isLeader: isLeader,
            ),
            ProjectsInfiniteList(
              sortBy: 'new',
              isLeader: isLeader,
            ),
            ProjectsInfiniteList(
              sortBy: 'trending',
              isLeader: isLeader,
            ),
            ProjectsInfiniteList(
              sortBy: 'rating',
              isLeader: isLeader,
            ),
          ],
        ),
      ),
    );
  }
}
