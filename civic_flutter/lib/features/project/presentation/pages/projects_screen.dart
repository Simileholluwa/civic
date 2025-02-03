import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier =
        ref.watch(paginatedProjectListProvider.notifier);
    return AppInfiniteList<Project>(
      pagingController: pagingControllerNotifier.pagingController,
      scrollController: ref.read(projectScrollControllerProvider),
      itemBuilder: (context, project, index) {
        return ProjectCard(
          project: project,
          index: index,
        );
      },
      onRefresh: pagingControllerNotifier.refresh,
    );
  }
}
