import 'dart:convert';
import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
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
    final width = MediaQuery.sizeOf(context).width;
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
                              tabAlignment: width > 450
                                  ? TabAlignment.fill
                                  : TabAlignment.start,
                              isScrollable: width > 450 ? false : true,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicator: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              activeColor: Colors.white,
                              tabs: [
                                Tab(
                                  text: 'ALL',
                                ),
                                Tab(text: 'NEW'),
                                Tab(text: 'TRENDING'),
                                Tab(text: 'TOP RATING'),
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
