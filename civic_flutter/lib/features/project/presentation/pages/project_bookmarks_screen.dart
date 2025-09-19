import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectBookmarksScreen extends ConsumerWidget {
  const ProjectBookmarksScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingController = ref.watch(
      paginatedProjectBookmarksListProvider.notifier,
    );
    final itemList = pagingController.pagingController.value.itemList;
    final isEmpty = itemList?.isEmpty ?? true;
    return AppAndroidBottomNav(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                toolbarHeight: 60,
                floating: true,
                centerTitle: true,
                snap: true,
                leading: IconButton(
                  icon: const Icon(
                    Iconsax.arrow_left_2,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(1),
                  child: Divider(
                    height: 0,
                  ),
                ),
                actions: [
                  IconButton(
                    onPressed: isEmpty ? null : () async {
                      await ProjectHelperFunctions.clearBookmarksDialog(
                        ref,
                        context,
                      );
                    },
                    icon: const Icon(
                      Iconsax.trash,
                      size: 26,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                ],
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'BOOKMARKS',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 25,
                              ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 22, left: 1),
                      child: AppDecorationDot(),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: AppInfiniteList<Project>(
            pagingController: pagingController.pagingController,
            canCreate: false,
            itemBuilder: (__, project, _) {
              return ProjectCard(
                project: project,
              );
            },
            onRefresh: pagingController.refresh,
          ),
        ),
      ),
    );
  }
}