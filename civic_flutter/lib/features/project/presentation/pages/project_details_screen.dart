import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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
          final pageControllerNotifier =
              ref.watch(projectDetailPageControllerProvider.notifier);
          final currentPageState = ref.watch(projectDetailCurrentPageProvider);
          final defaultTextStyle = DefaultTextStyle.of(context);
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 400,
                automaticallyImplyLeading: false,
                pinned: true,
                titleSpacing: 8,
                leading: IconButton(
                  icon: Icon(Iconsax.arrow_left_2),
                  onPressed: context.pop,
                ),
                actions: [
                  IconButton(
                    icon: Icon(Iconsax.heart),
                    onPressed: () {},
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
                    margin: const EdgeInsets.only(
                      top: 61,
                      bottom: 10,
                    ),
                    child: projectCardState.imagesUrl.length == 1
                        ? ContentSingleCachedImage(
                            imageUrl: projectCardState.imagesUrl.first,
                          )
                        : ContentMultipleCachedImage(
                            imageUrls: projectCardState.imagesUrl,
                          ),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: ProjectDetailHeader(
                  maxHeight: projectCardState.canVet ? 187 : 121,
                  minHeight: projectCardState.canVet ? 187 : 121,
                  delegate: ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      spacing: 15,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 5, 16, 0),
                          child: Text(
                            projectCardState.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 20,
                                ),
                          ),
                        ),
                        ProjectQuickDetails(
                          project: project,
                        ),
                        if (projectCardState.canVet)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 3),
                            child: Row(
                              spacing: 10,
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 45,
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      label: Text(
                                        'Approve',
                                        style: const TextStyle().copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      icon: Icon(
                                        Icons.thumb_up_alt_rounded,
                                        color: TColors.textWhite,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: TColors.primary,
                                        foregroundColor: TColors.textWhite,
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: 45,
                                    child: ElevatedButton.icon(
                                      onPressed: () {},
                                      label: Text(
                                        'Disapprove',
                                        style: const TextStyle().copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      icon: Icon(
                                        Icons.thumb_down_alt_rounded,
                                        color: TColors.textWhite,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: TColors.secondary,
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
                        SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: 15,
                            children: [
                              ...[
                                'OVERVIEW',
                                'CATEGORY',
                                'STATUS',
                                'FUNDING',
                                'LOCATION',
                                'ATTACHMENTS'
                              ].asMap().entries.map(
                                (filter) {
                                  final text = filter.value;
                                  final index = filter.key;
                                  return GestureDetector(
                                    onTap: () {
                                      pageControllerNotifier.jumpToPage(
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
                                                : Theme.of(context).hintColor,
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
                      ],
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: QuillEditor.basic(
                  controller: QuillController(
                    document: Document.fromJson(
                      jsonDecode(
                        project.description!,
                      ),
                    ),
                    selection: const TextSelection.collapsed(
                      offset: 0,
                    ),
                    readOnly: true,
                  ),
                  configurations: QuillEditorConfigurations(
                    customStyles: THelperFunctions.articleTextEditorStyles(
                      context,
                      defaultTextStyle,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    scrollPhysics: const NeverScrollableScrollPhysics(),
                    
                  ),
                ),
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          bottom: TSizes.xs,
        ),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Theme.of(context).dividerColor,
            ),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 150,
                  ),
                  child: TextFormField(
                    controller: TextEditingController(),
                    maxLines: null,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      hintText: 'Share your opinion...',
                      errorStyle:
                          Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Theme.of(context).colorScheme.error,
                              ),
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: Theme.of(context).hintColor,
                              ),
                      errorMaxLines: 2,
                      contentPadding: EdgeInsets.fromLTRB(0, 4, 0, 12),
                      hintMaxLines: 1,
                    ),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
