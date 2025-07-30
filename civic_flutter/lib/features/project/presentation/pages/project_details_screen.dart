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
  });

  final int projectId;
  final Project? project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      projectDetailProvider(projectId, project),
    );
    final liveProject = ref.watch(
      projectStreamProvider(
        projectId,
        project,
      ),
    );
    final newProject = liveProject.value ?? data.value;
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        newProject
      ),
    );
    final tabController = ref.watch(projectDetailsTabControllerProvider);
    final projectCardNotifier = ref.watch(
      projectCardWidgetProvider(
        newProject
      ).notifier,
    );
    return Scaffold(
      appBar: AppBar(
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
                    const SizedBox(
                      width: 5,
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
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: projectCardState.isOwner!
                          ? null
                          : () async {
                              await projectCardNotifier
                                  .subscribeToNotifications(
                                data.value!.id!,
                              );
                            },
                      icon: Icon(
                        projectCardState.isSubscribed
                            ? Iconsax.notification_bing5
                            : Iconsax.notification_bing,
                        color: projectCardState.isOwner!
                            ? null
                            : projectCardState.isSubscribed
                                ? TColors.primary
                                : Theme.of(context).iconTheme.color,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                      onPressed: projectCardState.isDeleted!
                          ? null
                          : () {
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    contentPadding: const EdgeInsets.only(bottom: 16,),
                                    content: ShowProjectActions(
                                      project: newProject!,
                                      fromDetails: true,
                                    ),
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppTabBarDesign(
            showTopBorder: true,
            tabController: tabController,
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
          if (projectCardState.isOwner! || projectCardState.isDeleted!) {
            return null;
          }
          return ProjectDetailsBottomNavigationWidget(
            project: newProject!,
          );
        },
        error: (error, st) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
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
          return TabBarView(
            controller: tabController,
            children: [
              ProjectDetailsWidget(
                project: newProject!,
              ),
              ProjectOverviewWidget(
                project: newProject,
              ),
              ProjectReviewsList(
                project: newProject,
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
