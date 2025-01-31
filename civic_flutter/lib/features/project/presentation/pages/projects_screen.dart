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
              ...['ALL', 'TRENDING', 'RECENT'].asMap().entries.map(
                (filter) {
                  final text = filter.value;
                  final index = filter.key;
                  return GestureDetector(
                    onTap: () {},
                    child: Text(
                      text,
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: 1 == index
                                ? Theme.of(context).textTheme.labelMedium!.color
                                : Theme.of(context).hintColor,
                            fontWeight: 1 == index
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
            onPressed: () {
              projectWidgetsNotifier.toggleFilter();
            },
            icon: Icon(
              Icons.filter_list,
              
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Iconsax.notification5,
              size: 26,
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Stack(
        children: [
          AppInfiniteList<Project>(
            pagingController: pagingControllerNotifier.pagingController,
            scrollController: ref.read(projectScrollControllerProvider),
            itemBuilder: (context, project, index) {           
              return ProjectCard(
                project: project,
                index: index,
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
                      ? MediaQuery.of(context).size.height * .6
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: const ProjectFloatingActionButton(),
    );
  }
}
