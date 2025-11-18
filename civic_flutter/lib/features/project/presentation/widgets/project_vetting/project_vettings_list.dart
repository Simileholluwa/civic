import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectVettingsList extends ConsumerWidget {
  const ProjectVettingsList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pagingState = ref.watch(
      paginatedProjectVettingListProvider,
    );
    return AppInfiniteList<ProjectVetting>(
      pagingController: pagingState,
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
      onRefresh: pagingState.refresh,
      firstPageProgressIndicator: const Padding(
        padding: EdgeInsets.only(
          top: 50,
        ),
        child: AppLoadingWidget(),
      ),
    );
  }
}
