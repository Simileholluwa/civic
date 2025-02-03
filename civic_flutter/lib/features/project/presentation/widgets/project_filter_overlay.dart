import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectFilterOverlay extends ConsumerWidget {
  const ProjectFilterOverlay({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectWidgetsState = ref.watch(projectScreenWidgetsProvider);
    final screenHeight = MediaQuery.of(context).size.height;
    final tabController = ref.watch(projectScreenTabProvider);
    return AnimatedPositioned(
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
    );
  }
}
