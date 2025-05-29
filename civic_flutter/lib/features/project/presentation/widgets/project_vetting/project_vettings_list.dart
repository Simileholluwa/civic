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
      shrinkWrap: true,
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
      noItemsFound: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            Image(
              height: 250,
              image: AssetImage(
                TImageTexts.noData,
              ),
            ),
            Text(
              "There are no vettings... yet. Be the first! Tap on the vet button to get started.",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      firstPageProgressIndicator: Padding(
        padding: const EdgeInsets.only(
          top: 50,
        ),
        child: AppLoadingWidget(),
      ),
    );
  }
}
