

import 'dart:ui';
import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:iconsax/iconsax.dart';

class ProjectsScreen extends ConsumerStatefulWidget {
  const ProjectsScreen({
    super.key,
    required this.sendProject,
  });

  final VoidCallback? sendProject;

  @override
  ConsumerState<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends ConsumerState<ProjectsScreen> {
  DateTimeRange? customDateRange;

  @override
  Widget build(BuildContext context) {
    if (widget.sendProject != null) {
      Future.delayed(Duration.zero, () {
        widget.sendProject!();
      });
    }
    final screenHeight = MediaQuery.of(context).size.height;
    final pagingControllerNotifier =
        ref.watch(paginatedProjectListProvider.notifier);
    final projectWidgetsState = ref.watch(projectScreenWidgetsProvider);
    final projectWidgetsNotifier =
        ref.watch(projectScreenWidgetsProvider.notifier);
    final tabController = ref.watch(projectScreenTabProvider);
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(
          65,
        ),
        child: Container(
          padding: const EdgeInsets.only(
            bottom: TSizes.sm,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'Projects',
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
                onPressed: () {
                  projectWidgetsNotifier.toggleFilter();
                },
                icon: Icon(
                  projectWidgetsState.isActiveFilter
                      ? Iconsax.filter5
                      : Iconsax.filter,
                  color: projectWidgetsState.isActiveFilter
                      ? TColors.primary
                      : Theme.of(context).iconTheme.color,
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
              const SizedBox(
                width: 5,
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          AppInfiniteList<Project>(
            pagingController: pagingControllerNotifier.pagingController,
            itemBuilder: (context, project, index) {
              return Center(
                child: Text(
                  project.title!,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              );
            },
            onRefresh: pagingControllerNotifier.refresh,
          ),
          if (projectWidgetsState.isActiveFilter)
            GestureDetector(
              onTap: () {
                projectWidgetsNotifier.toggleFilter();
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 5,
                  sigmaY: 5,
                ),
                child: AnimatedContainer(
                  color: Theme.of(context).scaffoldBackgroundColor.withOpacity(
                        0.5,
                      ),
                  duration: const Duration(milliseconds: 1000),
                  width: MediaQuery.of(context).size.width,
                  height: projectWidgetsState.isActiveFilter
                      ? MediaQuery.of(context).size.height
                      : 0,
                ),
              ),
            ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: projectWidgetsState.isActiveFilter ? 0 : -screenHeight,
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: MediaQuery.of(context).size.width,
                  height: projectWidgetsState.isActiveFilter
                      ? MediaQuery.of(context).size.height - 160
                      : 0,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 70),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TabBar(
                        controller: tabController,
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        labelColor: isDark ? TColors.textWhite : TColors.dark,
                        unselectedLabelColor:
                            isDark ? TColors.darkerGrey : TColors.darkGrey,
                        padding: const EdgeInsets.only(
                          left: TSizes.xs - 1,
                          right: TSizes.xs,
                        ),
                        unselectedLabelStyle:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                        labelStyle:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                        indicatorColor:
                            isDark ? TColors.textWhite : TColors.dark,
                        indicatorWeight: 4,
                        tabs: [
                          ...selectedFilters.keys.map(
                            (filter) {
                              return Tab(
                                text: filter,
                              );
                            },
                          ),
                        ],
                      ),
                      Flexible(
                        child: TabBarView(
                          controller: tabController,
                          children: const [
                            ProjectCategoryFilter(),
                            ProjectFundingFilter(),
                            ProjectAttachmentFilter(),
                            ProjectCostFilter(),
                            ProjectDateFilter(),
                            ProjectLocationFilter(),
                            ProjectStatusFilter(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const ProjectFilterButtons(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: projectWidgetsState.isActiveFilter
          ? const ProjectFloatingActionButton()
          : null,
    );
  }
}

class FilterColumnDivider extends StatelessWidget {
  const FilterColumnDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context).dividerColor,
            thickness: 1,
            height: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'OR',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        Expanded(
          child: Divider(
            color: Theme.of(context).dividerColor,
            thickness: 1,
            height: 0,
          ),
        ),
      ],
    );
  }
}
