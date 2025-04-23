import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

class ProjectDetailsScreen extends ConsumerWidget {
  const ProjectDetailsScreen({
    super.key,
    required this.projectId,
    this.tab,
  });

  final int projectId;
  final String? tab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(projectDetailProvider(projectId));
    return StreamBuilder(
      initialData: data.value,
      stream: ref.read(clientProvider).project.projectUpdates(projectId),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var project = snapshot.data ?? data.value;
          if (project == null) {
            return const Center(
              child: Text(
                'Project not found',
              ),
            );
          }
          final projectCardState = ref.watch(
            projectCardWidgetProvider(
              project,
            ),
          );
          final tabController = ref.watch(projectDetailsTabControllerProvider(tab));
          final currentPageState = ref.watch(projectDetailCurrentPageProvider);
          final projectReviewStateNotifier =
              ref.watch(projectReviewListQueryProvider.notifier);
          final projectReviewState = ref.watch(projectReviewListQueryProvider);
          final pagingControllerNotifier =
              ref.watch(paginatedProjectReviewListProvider(projectId).notifier);

          final projectCardNotifier = ref.watch(
            projectCardWidgetProvider(
              project,
            ).notifier,
          );
          return Scaffold(
            appBar: ContentAppBar(
              title: const SizedBox(),
              isVisible: true,
              actions: [
                IconButton(
                  onPressed: projectCardState.isDeleted
                      ? null
                      : () async {
                          await projectCardNotifier.toggleLikeStatus(
                            project.id!,
                          );
                        },
                  icon: Icon(
                    projectCardState.hasLiked ? Iconsax.heart5 : Iconsax.heart,
                    color: projectCardState.isDeleted
                        ? Theme.of(context).disabledColor
                        : projectCardState.hasLiked
                            ? TColors.primary
                            : Theme.of(context).iconTheme.color!,
                  ),
                ),
                IconButton(
                  onPressed: projectCardState.isDeleted
                      ? null
                      : () {
                          if (projectCardState.hasReposted) {
                            ProjectHelperFunctions.undoRepostDialog(
                              context,
                              ref,
                              project.id!,
                            );
                            return;
                          }
                          context.push(
                            AppRoutes.createPost,
                            extra: {
                              'draft': null,
                              'project': project,
                              'id': 0,
                            },
                          );
                        },
                  icon: Icon(
                    projectCardState.hasReposted
                        ? Iconsax.repeate_music5
                        : Iconsax.repeate_music,
                    color: projectCardState.isDeleted
                        ? Theme.of(context).disabledColor
                        : projectCardState.hasReposted
                            ? TColors.primary
                            : Theme.of(context).iconTheme.color!,
                  ),
                ),
                IconButton(
                  onPressed: projectCardState.isDeleted
                      ? null
                      : () {
                          showModalBottomSheet(
                            context: context,
                            constraints: BoxConstraints(
                              maxHeight: projectCardState.isOwner
                                  ? 240
                                  : projectCardState.canVet
                                      ? 480
                                      : 430,
                            ),
                            builder: (ctx) {
                              return ShowProjectActions(
                                project: project,
                                projectCardNotifier: projectCardNotifier,
                                fromDetails: true,
                              );
                            },
                          );
                        },
                  icon: Icon(
                    Iconsax.more_circle,
                    color: projectCardState.isDeleted
                        ? Theme.of(context).disabledColor
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
              ],
              bottomHeight: 54,
              height: 45,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
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
                    if (currentPageState == 2 &&
                        project.overAllCategoryRating != null)
                      ProjectReviewFilterWidget(
                        project: project,
                        projectReviewState: projectReviewState,
                        projectReviewStateNotifier: projectReviewStateNotifier,
                        pagingControllerNotifier: pagingControllerNotifier,
                      ),
                  ],
                ),
              ),
              leading: IconButton(
                icon: Icon(Iconsax.arrow_left_2),
                onPressed: context.pop,
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                ProjectDetailsWidget(
                  projectCardState: projectCardState,
                ),
                ProjectOverviewWidget(
                  projectCardState: projectCardState,
                ),
                ProjectReviewsWidget(
                  project: project,
                  text: projectCardState.isDeleted &&
                          project.overAllCategoryRating == null
                      ? 'There are no reviews available for this project'
                      : null,
                ),
                const SizedBox(),
              ],
            ),
            bottomNavigationBar:
                projectCardState.isDeleted || projectCardState.isOwner
                    ? null
                    : ProjectDetailsBottomNavigationWidget(
                        projectCardState: projectCardState,
                        project: project,
                      ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
            ),
          );
        } else {
          return AppLoadingWidget();
        }
      },
    );
  }
}

class ProjectDetailsBottomNavigationWidget extends StatelessWidget {
  const ProjectDetailsBottomNavigationWidget({
    super.key,
    required this.projectCardState,
    required this.project,
  });

  final ProjectCardState projectCardState;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 15, 16, 5),
      child: Row(
        spacing: 10,
        children: [
          if (projectCardState.canVet)
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.push(
                      '/feed/${project.id!}/details/verify',
                      extra: project.physicalLocations,
                    );
                  },
                  label: Text(
                    'Vet',
                  ),
                  icon: Icon(
                    Iconsax.medal_star5,
                    color: TColors.textWhite,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.primary,
                    foregroundColor: TColors.textWhite,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  context.push(
                    '/feed/${project.id}/details/review',
                  );
                },
                label: Text(
                  'Review',
                ),
                icon: Icon(
                  Iconsax.magic_star5,
                  color: TColors.textWhite,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: TColors.textWhite,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectReviewFilterWidget extends StatelessWidget {
  const ProjectReviewFilterWidget({
    super.key,
    required this.projectReviewState,
    required this.projectReviewStateNotifier,
    required this.pagingControllerNotifier,
    required this.project,
  });

  final ProjectReviewQueryState projectReviewState;
  final ProjectReviewListQuery projectReviewStateNotifier;
  final PaginatedProjectReviewList pagingControllerNotifier;
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: const EdgeInsets.only(
        right: 18,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(
          TSizes.sm,
        ),

      ),
      child: Row(
        spacing: 10,
        children: [
          if (projectReviewState.cardinal != null)
            GestureDetector(
              onTap: () {
                projectReviewStateNotifier.clearQuery();
                pagingControllerNotifier.refresh();
              },
              child: SizedBox(
                height: 22,
                width: 40,
                child: Icon(
                  Iconsax.filter_remove5,
                  size: 23,
                  color: TColors.secondary,
                ),
              ),
            ),
          if (project.overAllCategoryRating != null)
            GestureDetector(
              onTap: () async {
                await ProjectHelperFunctions.projectReviewsFilterDialog(
                  context,
                  project.id!,
                );
              },
              child: SizedBox(
                height: 22,
                width: 40,
                child: Icon(
                  Iconsax.filter5,
                  size: 22,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class ProjectDetailsWidget extends StatelessWidget {
  const ProjectDetailsWidget({
    super.key,
    required this.projectCardState,
  });

  final ProjectCardState projectCardState;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          projectCardState.imagesUrl.length == 1
              ? ContentSingleCachedImage(
                  imageUrl: projectCardState.imagesUrl.first,
                  useMargin: false,
                )
              : ContentMultipleCachedImage(
                  imageUrls: projectCardState.imagesUrl,
                  useMargin: false,
                ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
            ),
            child: Text(
              projectCardState.title,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 23,
                  ),
            ),
          ),
          QuillEditor.basic(
            controller: QuillController(
              document: projectCardState.rawDescription,
              selection: const TextSelection.collapsed(
                offset: 0,
              ),
              readOnly: true,
            ),
            config: QuillEditorConfig(
              customStyles: THelperFunctions.articleTextEditorStyles(
                context,
                defaultTextStyle,
              ),
              scrollPhysics: const NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectOverviewWidget extends StatelessWidget {
  const ProjectOverviewWidget({
    super.key,
    required this.projectCardState,
  });

  final ProjectCardState projectCardState;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 10),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 25),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              border: Border(
                top: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 5,
                ),
                left: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
                right: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
                bottom: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              borderRadius: BorderRadius.circular(
                TSizes.md,
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor.withAlpha(30),
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProjectDetailTitleAndSubtitle(
                            title: 'Start Date',
                            subtitle: projectCardState.startDateISO,
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                child: VerticalDivider(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                    child: CircularProgressIndicator(
                                      value: projectCardState
                                          .percentageElapsedInDouble,
                                      strokeWidth: 4,
                                      color: Theme.of(context).primaryColor,
                                      backgroundColor: Theme.of(context)
                                          .primaryColor
                                          .withAlpha(
                                            50,
                                          ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        projectCardState
                                            .percentageElapsedInString,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              fontSize: 20,
                                            ),
                                      ),
                                      Text(
                                        'complete',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              fontSize: 9,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ProjectDetailTitleAndSubtitle(
                            title: 'End Date',
                            subtitle: projectCardState.endDateISO,
                          ),
                        ],
                      ),
                      const Divider(
                        height: 0,
                      ),
                    ],
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Category',
                    subtitle: projectCardState.category,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Sub-Category',
                    subtitle: projectCardState.subCategory,
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Funding',
                    subtitle: projectCardState.fundingAmount,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Funding Category',
                    subtitle: projectCardState.fundingCategory,
                  ),
                  ProjectDetailTitleAndSubtitle(
                    title: 'Funding Sub-Category',
                    subtitle: projectCardState.fundingSubCategory,
                  ),
                  if (projectCardState.hasPdf)
                    const Divider(
                      height: 0,
                    ),
                  if (projectCardState.hasPdf)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      spacing: 2,
                      children: [
                        ProjectDetailTitleAndSubtitle(
                          title: 'Attachments',
                          subtitle:
                              '${projectCardState.pdfAttachments.length} PDF ${projectCardState.pdfAttachments.length == 1 ? 'Attachment' : 'Attachments'} ',
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 10,
                            children: projectCardState.pdfAttachments
                                .asMap()
                                .entries
                                .map(
                              (entry) {
                                final index = entry.key;
                                return GestureDetector(
                                  onTap: () async {
                                    await launchUrl(
                                      Uri.parse(
                                        projectCardState.pdfAttachments[index],
                                      ),
                                    );
                                  },
                                  child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                      Container(
                                        height: 70,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .82,
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 6, 10, 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            TSizes.sm,
                                          ),
                                          border: Border.all(
                                            color:
                                                Theme.of(context).dividerColor,
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            FadeInImage(
                                              image: AssetImage(
                                                'assets/images/pdf.png',
                                              ),
                                              placeholder: MemoryImage(
                                                kTransparentImage,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                            Flexible(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    projectCardState
                                                        .pdfAttachments[index]
                                                        .split('/')
                                                        .last,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 20,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(
                                              TSizes.sm,
                                            ),
                                            topLeft: Radius.circular(
                                              TSizes.sm,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${index + 1}/${projectCardState.pdfAttachments.length}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectDetailTitleAndSubtitle extends StatelessWidget {
  const ProjectDetailTitleAndSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 13,
              ),
        ),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 20,
              ),
        ),
      ],
    );
  }
}