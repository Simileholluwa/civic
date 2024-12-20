import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:iconsax/iconsax.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({
    super.key,
    required this.sendProject,
  });

  final VoidCallback? sendProject;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (sendProject != null) {
      Future.delayed(Duration.zero, () {
        sendProject!();
      });
    }
    final screenHeight = MediaQuery.of(context).size.height;
    final pagingControllerNotifier =
        ref.watch(paginatedProjectListProvider.notifier);
    final projectWidgetsState = ref.watch(projectScreenWidgetsProvider);
    final projectWidgetsNotifier =
        ref.watch(projectScreenWidgetsProvider.notifier);
    final tabController = ref.watch(projectScreenTabProvider);
    final isVisible = ref.watch(scrollVisibilityProvider);
    return Scaffold(
      body: Stack(
        children: [
          AppInfiniteList<Project>(
            pagingController: pagingControllerNotifier.pagingController,
            itemBuilder: (context, project, index) {
              return ProjectCard(
                project: project,
                index: index,
              );
            },
            onRefresh: pagingControllerNotifier.refresh,
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: isVisible ? 0 : -70,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              height: 55,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'Projects',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  Row(
                    children: [
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
                    ],
                  )
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            top: projectWidgetsState.isActiveFilter ? 55 : -screenHeight,
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: MediaQuery.of(context).size.width,
                  height: projectWidgetsState.isActiveFilter
                      ? MediaQuery.of(context).size.height - 140
                      : 0,
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 70),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTabBarDesign(
                        tabController: tabController,
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
      floatingActionButton: const ProjectFloatingActionButton(),
    );
  }
}
