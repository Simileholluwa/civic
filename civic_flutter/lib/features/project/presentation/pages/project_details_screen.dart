import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectDetailsScreen extends ConsumerWidget {
  const ProjectDetailsScreen({
    required this.projectId,
    super.key,
    this.project,
  });

  final int projectId;
  final Project? project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      projectDetailProvider(projectId, project),
    );
    final tabController = ref.watch(projectDetailsTabControllerProvider);
    final currentPage = ref.watch(projectDetailCurrentPageProvider);
    final ratingCount = ref.watch(
      projectOverallRatingCountsProvider(
        project,
      ).select(
        (s) => s.totalRating,
      ),
    );
    final userId = ref.read(localStorageProvider).getInt('userId');
    final isOwner = project?.ownerId == userId;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            data.when(
              data: (value) {
                final projectProv = projectCardWidgetProvider(
                  ProjectWithUserStateKey(
                    value,
                  ),
                );
                final projectNotif = ref.read(projectProv.notifier);
                final project = value.project;
                final hasLiked = ref.watch(
                  projectProv.select(
                    (s) => s.hasLiked,
                  ),
                );
                final hasReposted = ref.watch(
                  projectProv.select(
                    (s) => s.hasReposted,
                  ),
                );
                final isSubscribed = ref.watch(
                  projectProv.select(
                    (s) => s.isSubscribed,
                  ),
                );
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 5,
                  ),
                  child: Row(
                    spacing: 5,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await projectNotif.toggleLikeStatus(
                            project.id!,
                          );
                        },
                        icon: Icon(
                          hasLiked ? Iconsax.heart5 : Iconsax.heart,
                          color: hasLiked
                              ? TColors.primary
                              : Theme.of(context).iconTheme.color!,
                        ),
                      ),

                      IconButton(
                        onPressed: () async {
                          await context.push(
                            '/create/post/0',
                            extra: {
                              'projectToQuote': project,
                            },
                          );
                        },
                        icon: Icon(
                          Iconsax.repeate_music,
                          color: hasReposted
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).iconTheme.color!,
                        ),
                      ),

                      IconButton(
                        onPressed: isOwner
                            ? null
                            : () async {
                                await projectNotif.subscribeToNotifications(
                                  project.id!,
                                );
                              },
                        icon: Icon(
                          isSubscribed
                              ? Iconsax.notification_bing5
                              : Iconsax.notification_bing,
                          color: isOwner
                              ? null
                              : isSubscribed
                              ? TColors.primary
                              : Theme.of(context).iconTheme.color,
                        ),
                      ),
                      AnimatedCrossFade(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        crossFadeState: currentPage == 2 && ratingCount > 2
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        firstChild: const SizedBox.shrink(),
                        secondChild: IconButton(
                          onPressed: () async {
                            final queryState = ref.read(
                              projectReviewListQueryProvider,
                            );
                            final query = {
                              'sortBy': queryState.sortby,
                              'order': queryState.order,
                              'rating': queryState.rating,
                              'cardinal': queryState.cardinal,
                            };
                            final res =
                                await showModalBottomSheet<
                                  Map<String, dynamic>
                                >(
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (context) {
                                    return ShowFilterReviews(
                                      initialQuery: query,
                                      ratingCount: ratingCount,
                                    );
                                  },
                                );
                            if (res == null) return;
                            if (res == query) return;
                            ref
                                .read(projectReviewListQueryProvider.notifier)
                                .setQuery(
                                  res,
                                );
                          },
                          icon: const Icon(
                            Iconsax.filter,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await showDialog<dynamic>(
                            context: context,
                            builder: (ctx) {
                              return AlertDialog(
                                contentPadding: const EdgeInsets.only(
                                  bottom: 16,
                                ),
                                content: ShowProjectActions(
                                  projectWithUserState: value,
                                  fromDetails: true,
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Iconsax.more_circle,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (_, _) => const SizedBox.shrink(),
              loading: () => const SizedBox.shrink(),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppTabBarDesign(
              showTopBorder: true,
              tabController: tabController,
              tabs: const [
                Tab(text: 'DETAILS'),
                Tab(text: 'OVERVIEW'),
                Tab(text: 'REVIEWS'),
                Tab(text: 'VETTINGS'),
              ],
            ),
          ),
          leading: IconButton(
            icon: const Icon(Iconsax.arrow_left_2),
            onPressed: context.pop,
          ),
        ),
        bottomNavigationBar: data.when(
          data: (value) {
            final project = value.project;
            final userId = ref.read(localStorageProvider).getInt('userId');
            final isOwner = project.ownerId == userId;
            if (isOwner) {
              return null;
            }
            return ProjectDetailsBottomNavigationWidget(
              project: project,
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
          data: (value) {
            return TabBarView(
              controller: tabController,
              children: [
                ProjectDetailsWidget(
                  project: value.project,
                ),
                ProjectOverviewWidget(
                  project: value.project,
                ),
                ProjectReviewsList(
                  project: value.project,
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
            return const AppLoadingWidget();
          },
        ),
      ),
    );
  }
}
