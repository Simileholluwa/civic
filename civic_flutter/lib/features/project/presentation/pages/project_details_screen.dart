import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

class ProjectDetailsScreen extends ConsumerWidget {
  const ProjectDetailsScreen({
    super.key,
    required this.projectId,
    this.project,
    this.tab,
  });

  final int projectId;
  final Project? project;
  final String? tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = project == null
        ? ref.watch(projectDetailProvider(projectId))
        : AsyncValue.data(
            project,
          );
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        data.hasValue ? data.value : null,
      ),
    );
    final tabController = ref.watch(projectDetailsTabControllerProvider(tab));
    final projectCardNotifier = ref.watch(
      projectCardWidgetProvider(
        data.hasValue ? data.value : null,
      ).notifier,
    );
    return Scaffold(
      appBar: ContentAppBar(
        title: const SizedBox(),
        isVisible: true,
        actions: data.hasValue && !data.hasError
            ? data.value == null
                ? []
                : [
                    IconButton(
                      onPressed: projectCardState.isDeleted!
                          ? null
                          : () async {
                              await projectCardNotifier.toggleLikeStatus(
                                data.value!.id!,
                              );
                            },
                      icon: Icon(
                        projectCardState.hasLiked!
                            ? Iconsax.heart5
                            : Iconsax.heart,
                        color: projectCardState.isDeleted!
                            ? Theme.of(context).disabledColor
                            : projectCardState.hasLiked!
                                ? TColors.primary
                                : Theme.of(context).iconTheme.color!,
                      ),
                    ),
                    IconButton(
                      onPressed: projectCardState.isDeleted!
                          ? null
                          : () {
                            
                              context.push(
                                '/create/post/0',
                                extra: {
                                  'project': project,
                                },
                              );
                            },
                      icon: Icon(
                        Iconsax.repeate_music,
                        color: projectCardState.isDeleted!
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).iconTheme.color!,
                      ),
                    ),
                    IconButton(
                      onPressed: projectCardState.isDeleted!
                          ? null
                          : () {
                              showModalBottomSheet(
                                context: context,
                                constraints: BoxConstraints(
                                  maxHeight: projectCardState.isOwner!
                                      ? 240
                                      : projectCardState.canVet!
                                          ? 480
                                          : 430,
                                ),
                                builder: (ctx) {
                                  return ShowProjectActions(
                                    project: data.value!,
                                    fromDetails: true,
                                  );
                                },
                              );
                            },
                      icon: Icon(
                        Iconsax.more_circle,
                        color: projectCardState.isDeleted!
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ]
            : [],
        bottomHeight: 54,
        height: 45,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppTabBarDesign(
            tabController: tabController,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(text: 'DETAILS'),
              Tab(text: 'OVERVIEW'),
              Tab(text: 'REVIEWS'),
              Tab(text: 'VETTINGS'),
            ],
          ),
        ),
        leading: IconButton(
          icon: Icon(Iconsax.arrow_left_2),
          onPressed: context.pop,
        ),
      ),
      bottomNavigationBar: data.when(
        data: (value) {
          if (projectCardState.isOwner!) {
            return null;
          }
          return ProjectDetailsBottomNavigationWidget(
            project: value!,
          );
        },
        error: (error, st) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: ContentSingleButton(
              onPressed: () {
                ref.invalidate(
                  projectDetailProvider,
                );
              },
              text: 'Retry',
              buttonIcon: Iconsax.refresh,
            ),
          );
        },
        loading: () {
          return null;
        },
      ),
      body: data.when(
        data: (project) {
          if (project == null) {
            return const Center(
              child: Text('Post not found'),
            );
          }
          return TabBarView(
            controller: tabController,
            children: [
              ProjectDetailsWidget(
                project: project,
              ),
              ProjectOverviewWidget(
                project: project,
              ),
              ProjectReviewsList(
                project: project,
                text: projectCardState.isDeleted! && data.value == null
                    ? 'There are no reviews available for this project'
                    : null,
              ),
              const ProjectVettingsList(),
            ],
          );
        },
        error: (error, st) {
          return Center(
            child: LoadingError(
              retry: null,
              errorMessage: error.toString(),
              mainAxisAlignment: MainAxisAlignment.center,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
            ),
          );
        },
        loading: () {
          return AppLoadingWidget();
        },
      ),
    );
  }
}
