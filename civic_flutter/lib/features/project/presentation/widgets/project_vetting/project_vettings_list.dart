import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';

class ProjectVettingsList extends ConsumerWidget {
  const ProjectVettingsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingControllerNotifier = ref.watch(
      paginatedProjectVettingListProvider.notifier,
    );
    return AppInfiniteList<ProjectVetting>(
      pagingController: pagingControllerNotifier.pagingController,
      canCreate: false,
      itemBuilder: (context, vetting, index) {
        final liveProjectVetting = ref.watch(
          projectVettingStreamProvider(
            vetting.id!,
            vetting,
          ),
        );
        return ProjectVettingCard(
              projectVetting: liveProjectVetting.value ?? vetting,
            );
        
      },
      onRefresh: pagingControllerNotifier.refresh,
      firstPageProgressIndicator: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: AppLoadingWidget(),
      ),
    );
  }
}
