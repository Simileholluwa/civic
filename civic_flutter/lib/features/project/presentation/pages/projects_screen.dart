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
    final isVisible = ref.watch(appScrollVisibilityProvider);
    final isVisibleNotifier = ref.watch(appScrollVisibilityProvider.notifier);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: AppBar(
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
                  if (isVisible) {
                    isVisibleNotifier.hide();
                  }
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
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          AppInfiniteList<Project>(
            pagingController: pagingControllerNotifier.pagingController,
            scrollController: ref.read(projectScrollControllerProvider),
            itemBuilder: (context, project, index) {
              final isLiked = ref.watch(
                likedProjectProvider(
                  project.id!,
                ),
              );
              return ProjectCard(
                project: project,
                index: index,
                isLiked: isLiked.value ?? false,
              );
            },
            onRefresh: pagingControllerNotifier.refresh,
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
                      ? MediaQuery.of(context).size.height - 90
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
