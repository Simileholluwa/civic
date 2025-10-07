import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProjectsInfiniteList extends ConsumerWidget {
  const ProjectsInfiniteList({
    required this.sortBy,
    required this.isLeader,
    super.key,
  });

  final String sortBy;
  final bool isLeader;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedProjectListProvider(sortBy).notifier);
    return AppInfiniteList<Project>(
      pagingController: pagingControllerNotifier.pagingController,
      scrollPhysics: const NeverScrollableScrollPhysics(),
      canCreate: isLeader,
      onCreate: () async {
        await context.push(
          '/create/project/0',
        );
      },
      itemBuilder: (__, project, _) {
        return ProjectCard(
          project: project,
        );
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
