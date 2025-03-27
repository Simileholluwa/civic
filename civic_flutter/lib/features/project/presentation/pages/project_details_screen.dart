import 'package:civic_client/civic_client.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsScreen extends ConsumerWidget {
  const ProjectDetailsScreen({
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(projectDetailProvider(id));

    return Scaffold(
      body: data.when(
        data: (project) {
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
          final currentPageState = ref.watch(projectDetailCurrentPageProvider);
          final currentPageNotifier =
              ref.watch(projectDetailCurrentPageProvider.notifier);
          final projectReviewStateNotifier =
              ref.watch(projectReviewListQueryProvider.notifier);
          final projectReviewState = ref.watch(projectReviewListQueryProvider);
          final pagingControllerNotifier =
              ref.watch(paginatedProjectReviewListProvider(id).notifier);
          final defaultTextStyle = DefaultTextStyle.of(context);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: projectCardState.isDeleted
                    ? 0
                    : MediaQuery.of(context).size.height * .84,
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                titleSpacing: 8,
                toolbarHeight: 50,
                leading: IconButton(
                  icon: Icon(Iconsax.arrow_left_2),
                  onPressed: context.pop,
                ),
                actions: projectCardState.isDeleted
                    ? []
                    : [
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.save),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Iconsax.more_circle),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                      ],
                flexibleSpace: projectCardState.isDeleted
                    ? FlexibleSpaceBar()
                    : FlexibleSpaceBar(
                        background: Container(
                          margin: const EdgeInsets.fromLTRB(18, 61, 18, 0),
                          child: SingleChildScrollView(
                            child: Column(
                              spacing: 10,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                projectCardState.imagesUrl.length == 1
                                    ? ContentSingleCachedImage(
                                        imageUrl:
                                            projectCardState.imagesUrl.first,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
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
                                  configurations: QuillEditorConfigurations(
                                    customStyles: THelperFunctions
                                        .articleTextEditorStyles(
                                      context,
                                      defaultTextStyle,
                                    ),
                                    scrollPhysics:
                                        const NeverScrollableScrollPhysics(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
              ),
              if (!projectCardState.isDeleted)
                SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 70,
                        margin: const EdgeInsets.only(
                          top: 15,
                          bottom: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).dividerColor,
                          borderRadius: BorderRadius.circular(
                            TSizes.sm,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              SliverPersistentHeader(
                pinned: true,
                delegate: ProjectDetailHeader(
                  maxHeight: projectCardState.isDeleted ? 40 : 98,
                  minHeight: projectCardState.isDeleted ? 40 : 98,
                  delegate: ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!projectCardState.isDeleted)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 3, 16, 3),
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
                                            '/feed/project/$id/verify',
                                            extra: project.physicalLocations,
                                          );
                                        },
                                        label: Text(
                                          'Verify',
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
                                          '/feed/project/$id/review',
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
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SingleChildScrollView(
                              padding: const EdgeInsets.fromLTRB(18, 2, 18, 0),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 15,
                                children: [
                                  ...(projectCardState.isDeleted
                                          ? ['REVIEWS', 'VETTINGS']
                                          : ['OVERVIEW', 'REVIEWS', 'VETTINGS'])
                                      .asMap()
                                      .entries
                                      .map(
                                    (filter) {
                                      final text = filter.value;
                                      final index = filter.key;
                                      return GestureDetector(
                                        onTap: () {
                                          currentPageNotifier.setCurrentPage(
                                            index,
                                          );
                                        },
                                        child: Text(
                                          text,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                color: currentPageState == index
                                                    ? Theme.of(context)
                                                        .textTheme
                                                        .labelMedium!
                                                        .color
                                                    : Theme.of(context)
                                                        .hintColor,
                                                fontWeight:
                                                    currentPageState == index
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
                            if (projectCardState.isDeleted
                                ? currentPageState == 0
                                : currentPageState == 1 &&
                                    project.overAllCategoryRating != null)
                              Row(
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
                                        width: 20,
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
                                        await projectReviewsFilterDialog(
                                          context,
                                          id,
                                        );
                                      },
                                      child: SizedBox(
                                        height: 22,
                                        width: 50,
                                        child: Icon(
                                          Iconsax.filter5,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                          ],
                        ),
                        const Divider(height: 0),
                      ],
                    ),
                  ),
                ),
              ),
              if (!projectCardState.isDeleted)
                if (currentPageState == 0)
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * .82,
                      child: SingleChildScrollView(
                        child: ProjectOverviewScreen(
                          project: project,
                        ),
                      ),
                    ),
                  ),
              if (projectCardState.isDeleted
                  ? currentPageState == 0
                  : currentPageState == 1)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .82,
                    child: SingleChildScrollView(
                      child: ProjectReviewsScreen(
                        project: project,
                        text: projectCardState.isDeleted &&
                                project.overAllCategoryRating == null
                            ? 'There are no reviews available for this project'
                            : null,
                      ),
                    ),
                  ),
                ),
              if (projectCardState.isDeleted
                  ? currentPageState == 1
                  : currentPageState == 2)
                SliverToBoxAdapter(
                  child: SizedBox(),
                ),
            ],
          );
        },
        error: (error, st) {
          return Center(
            child: Text(
              error.toString(),
            ),
          );
        },
        loading: () {
          return AppLoadingWidget();
        },
      ),
    );
  }

  Future<dynamic> projectReviewsFilterDialog(
    BuildContext context,
    int id,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return Consumer(
          builder: (context, ref, child) {
            final projectReviewState =
                ref.watch(projectReviewListQueryProvider);
            final projectReviewStateNotifier =
                ref.watch(projectReviewListQueryProvider.notifier);
            final pagingControllerNotifier =
                ref.watch(paginatedProjectReviewListProvider(id).notifier);
            return LayoutBuilder(
              builder: (ctx, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: constraints.maxHeight * 0.9,
                  ),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              TSizes.sm,
                            ),
                          ),
                          elevation: 8,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Filter reviews',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      color: TColors.secondary,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: TSizes.md,
                              ),
                              const Divider(
                                height: 0,
                              ),
                              SingleChildScrollView(
                                padding: const EdgeInsets.only(
                                  top: TSizes.sm + 4,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      padding: const EdgeInsets.only(
                                        top: 2,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        spacing: 15,
                                        children: [
                                          ...['All', 5, 4, 3, 2, 1]
                                              .asMap()
                                              .entries
                                              .map(
                                            (filter) {
                                              final text = filter.value;
                                              final index = filter.key;
                                              return FilterChip(
                                                label: Row(
                                                  spacing: 5,
                                                  children: [
                                                    Text(
                                                      text.toString(),
                                                    ),
                                                    if (index > 0)
                                                      Icon(
                                                        Iconsax.magic_star5,
                                                        size: 16,
                                                      ),
                                                  ],
                                                ),
                                                selected: projectReviewState
                                                            .rating !=
                                                        null
                                                    ? projectReviewState
                                                            .rating ==
                                                        text
                                                    : index == 0,
                                                onSelected: (value) {
                                                  if (index == 0) {
                                                    projectReviewStateNotifier
                                                        .setRatingQuery(
                                                      null,
                                                    );
                                                    return;
                                                  }
                                                  projectReviewStateNotifier
                                                      .setRatingQuery(
                                                    (text as int).toDouble(),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (projectReviewState.rating != null)
                                      SingleChildScrollView(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 15, 0, 5),
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          spacing: 15,
                                          children: [
                                            ...[
                                              'All',
                                              'Location',
                                              'Description',
                                              'Attachments',
                                              'Category',
                                              'Funding',
                                              'Dates'
                                            ].asMap().entries.map(
                                              (filter) {
                                                final text = filter.value;
                                                final index = filter.key;
                                                return FilterChip(
                                                  label: Text(
                                                    text,
                                                  ),
                                                  selected: projectReviewState
                                                              .cardinal !=
                                                          null
                                                      ? projectReviewState
                                                              .cardinal ==
                                                          text
                                                      : index == 0,
                                                  onSelected: (value) {
                                                    if (index == 0) {
                                                      projectReviewStateNotifier
                                                          .setCardinalQuery(
                                                        null,
                                                      );
                                                      return;
                                                    }
                                                    projectReviewStateNotifier
                                                        .setCardinalQuery(
                                                      text,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            'Most recent',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  3, 0, 0, 0),
                                          trailing: SizedBox(
                                            width: 20,
                                            height: 24,
                                            child: Radio(
                                              value: 0,
                                              groupValue: 0,
                                              onChanged: (value) {},
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          height: 0,
                                          indent: 3,
                                          endIndent: 3,
                                        ),
                                        ListTile(
                                          title: Text(
                                            'Most liked',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.fromLTRB(
                                                  3, 0, 0, 0),
                                          trailing: SizedBox(
                                            width: 20,
                                            height: 24,
                                            child: Radio(
                                              value: 1,
                                              groupValue: 0,
                                              onChanged: (value) {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    AppDualButton(
                                      onTapSkipButton: context.pop,
                                      activeButtonText: 'Apply filter',
                                      onTapActiveButton: () {
                                        if (projectReviewState.cardinal ==
                                            null) {
                                          TToastMessages.errorToast(
                                            'Please select a cardinal to apply filter.',
                                          );
                                          return;
                                        }
                                        pagingControllerNotifier.refresh();
                                        context.pop();
                                      },
                                      activeButtonLoading: false,
                                      skipButtonLoading: false,
                                      skipText: 'Cancel',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                );
              },
            );
          },
        );
      },
    );
  }
}

class ProjectOverviewScreen extends ConsumerWidget {
  const ProjectOverviewScreen({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCardState = ref.watch(
      projectCardWidgetProvider(project),
    );
    return Column(
      children: [
        Container(
          width: double.maxFinite,
          margin: const EdgeInsets.fromLTRB(18, 20, 18, 20),
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
                                      width: MediaQuery.of(context).size.width *
                                          .82,
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 6, 10, 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          TSizes.sm,
                                        ),
                                        border: Border.all(
                                          color: Theme.of(context).dividerColor,
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
                                          color: Theme.of(context).primaryColor,
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

class ProjectDetailHeader extends SliverPersistentHeaderDelegate {
  final Widget delegate;
  final double maxHeight;
  final double minHeight;

  ProjectDetailHeader({
    required this.delegate,
    required this.maxHeight,
    required this.minHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return delegate;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
