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

  static String routePath([int? id]) => '${id ?? ':id'}';
  static String routeName() => 'project/details';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(projectDetailProvider(id));
    final screenHeight = MediaQuery.of(context).size.height;
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
          final projectCardNotifier = ref.watch(
            projectCardWidgetProvider(
              project,
            ).notifier,
          );
          final currentPageState = ref.watch(projectDetailCurrentPageProvider);
          final currentPageNotifier =
              ref.watch(projectDetailCurrentPageProvider.notifier);
          final defaultTextStyle = DefaultTextStyle.of(context);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height * .84,
                automaticallyImplyLeading: false,
                pinned: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                titleSpacing: 8,
                toolbarHeight: 50,
                leading: IconButton(
                  icon: Icon(Iconsax.arrow_left_2),
                  onPressed: context.pop,
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      projectCardState.hasLiked == true
                          ? Iconsax.heart5
                          : Iconsax.heart,
                      color: projectCardState.hasLiked == true
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).iconTheme.color!,
                    ),
                    onPressed: () async {
                      await projectCardNotifier.toggleLikeStatus(
                        id,
                      );
                    },
                  ),
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
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    margin: const EdgeInsets.fromLTRB(18, 61, 18, 0),
                    child: SingleChildScrollView(
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
                              document:
                                  projectCardState.rawDescription ?? Document(),
                              selection: const TextSelection.collapsed(
                                offset: 0,
                              ),
                              readOnly: true,
                            ),
                            configurations: QuillEditorConfigurations(
                              customStyles:
                                  THelperFunctions.articleTextEditorStyles(
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
                  maxHeight: 98,
                  minHeight: 98,
                  delegate: ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (projectCardState.canVet)
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 3, 16, 3),
                            child: Row(
                              spacing: 10,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
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
                                        context.pushNamed(
                                          ProjectReviewScreen.routeName(),
                                          pathParameters: {
                                            'id': id.toString(),
                                          },
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
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 3, 16, 3),
                            child: Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        context.pushNamed(
                                          ProjectReviewScreen.routeName(),
                                          pathParameters: {
                                            'id': id.toString(),
                                          },
                                        );
                                      },
                                      label: Text(
                                        'Review project',
                                        style: const TextStyle().copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      icon: Icon(
                                        Iconsax.magic_star5,
                                        color: TColors.textWhite,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        foregroundColor: TColors.textWhite,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
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
                                  ...['OVERVIEW', 'REVIEWS', 'VETTINGS']
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
                            if (currentPageState == 1)
                              GestureDetector(
                                onTap: () {
                                  projectCardNotifier.toggleFilter();
                                },
                                child: SizedBox(
                                  height: 22,
                                  width: 50,
                                  child: Icon(
                                    Iconsax.document_filter5,
                                    size: 22,
                                    color: projectCardState.toggleFilter!
                                        ? Theme.of(context).primaryColor
                                        : Theme.of(context).iconTheme.color,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const Divider(height: 0),
                      ],
                    ),
                  ),
                ),
              ),
              if (currentPageState == 0)
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .82,
                    child: SingleChildScrollView(
                      child: Column(
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
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withAlpha(30),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ProjectDetailTitleAndSubtitle(
                                            title: 'Start Date',
                                            subtitle:
                                                projectCardState.startDateISO!,
                                          ),
                                          Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox(
                                                height: 100,
                                                child: VerticalDivider(
                                                  color: Theme.of(context)
                                                      .primaryColor,
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: projectCardState
                                                          .percentageElapsedInDouble,
                                                      strokeWidth: 4,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      backgroundColor:
                                                          Theme.of(context)
                                                              .primaryColor
                                                              .withAlpha(
                                                                50,
                                                              ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Text(
                                                        projectCardState
                                                            .percentageElapsedInString!,
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
                                            subtitle:
                                                projectCardState.endDateISO!,
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
                                    subtitle: projectCardState.category!,
                                  ),
                                  ProjectDetailTitleAndSubtitle(
                                    title: 'Sub-Category',
                                    subtitle: projectCardState.subCategory!,
                                  ),
                                  const Divider(
                                    height: 0,
                                  ),
                                  ProjectDetailTitleAndSubtitle(
                                    title: 'Funding',
                                    subtitle: projectCardState.fundingAmount!,
                                  ),
                                  ProjectDetailTitleAndSubtitle(
                                    title: 'Funding Category',
                                    subtitle: projectCardState.fundingCategory!,
                                  ),
                                  ProjectDetailTitleAndSubtitle(
                                    title: 'Funding Sub-Category',
                                    subtitle:
                                        projectCardState.fundingSubCategory!,
                                  ),
                                  if (projectCardState.hasPdf!)
                                    const Divider(
                                      height: 0,
                                    ),
                                  if (projectCardState.hasPdf!)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 2,
                                      children: [
                                        ProjectDetailTitleAndSubtitle(
                                          title: 'Attachments',
                                          subtitle:
                                              '${projectCardState.pdfAttachments!.length} PDF ${projectCardState.pdfAttachments!.length == 1 ? 'Attachment' : 'Attachments'} ',
                                        ),
                                        SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            spacing: 10,
                                            children: projectCardState
                                                .pdfAttachments!
                                                .asMap()
                                                .entries
                                                .map(
                                              (entry) {
                                                final index = entry.key;
                                                return GestureDetector(
                                                  onTap: () async {
                                                    await launchUrl(
                                                      Uri.parse(
                                                        projectCardState
                                                                .pdfAttachments![
                                                            index],
                                                      ),
                                                    );
                                                  },
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    children: [
                                                      Container(
                                                        height: 70,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            .82,
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                0, 6, 10, 6),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            TSizes.sm,
                                                          ),
                                                          border: Border.all(
                                                            color: Theme.of(
                                                                    context)
                                                                .dividerColor,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          children: [
                                                            FadeInImage(
                                                              image: AssetImage(
                                                                'assets/images/pdf.png',
                                                              ),
                                                              placeholder:
                                                                  MemoryImage(
                                                                kTransparentImage,
                                                              ),
                                                              fit: BoxFit.cover,
                                                            ),
                                                            Flexible(
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    projectCardState
                                                                        .pdfAttachments![
                                                                            index]
                                                                        .split(
                                                                            '/')
                                                                        .last,
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .labelMedium,
                                                                    maxLines: 2,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                              TSizes.sm,
                                                            ),
                                                            topLeft:
                                                                Radius.circular(
                                                              TSizes.sm,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            '${index + 1}/${projectCardState.pdfAttachments!.length}',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelMedium!
                                                                .copyWith(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
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
                    ),
                  ),
                ),
              if (currentPageState == 1)
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .82,
                        child: SingleChildScrollView(
                          child: ProjectReviewsScreen(
                            projectId: project.id!,
                            project: project,
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        top: projectCardState.toggleFilter! ? 0 : -screenHeight,
                        right: 0,
                        left: 0,
                        duration: const Duration(milliseconds: 500),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          width: MediaQuery.of(context).size.width,
                          height: screenHeight * .3,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            border: Border(
                              bottom: BorderSide(
                                color: Theme.of(context).dividerColor,
                                width: 1,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SingleChildScrollView(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 15, 18, 0),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  spacing: 15,
                                  children: [
                                    ...['All','5', '4', '3', '2', '1']
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
                                                text,
                                              ),
                                              if (index > 0)
                                                Icon(
                                                  Iconsax.magic_star5,
                                                  size: 16,
                                                ),
                                              
                                            ],
                                          ),
                                          
                                          onSelected: (value) {

                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                padding:
                                    const EdgeInsets.fromLTRB(18, 5, 18, 0),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  spacing: 15,
                                  children: [
                                    ...['All','Location', 'Description', 'Attachments', 'Category', 'Funding', 'Dates']
                                        .asMap()
                                        .entries
                                        .map(
                                      (filter) {
                                        final text = filter.value;
                                        final index = filter.key;
                                        return FilterChip(
                                          label: Text(
                                            text,
                                          ),
                                          
                                          onSelected: (value) {

                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              if (currentPageState == 2)
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
          return AppLoadingWidget(
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
          );
        },
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
