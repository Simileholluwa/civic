import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateProjectWidget extends ConsumerWidget {
  const CreateProjectWidget({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final pageController = ref.watch(projectPageControllerProvider);
    final currentPageNotifier = ref.watch(projectCurrentPageProvider.notifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ProjectProgressIndicator(),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 4,
          ),
          child: const Divider(height: 0),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              currentPageNotifier.setCurrentPage(index);
            },
            physics: const ClampingScrollPhysics(),
            children: [
              ProjectOverviewPageView(
                project: project,
              ),
              ProjectCategoryPageView(
                project: project,
              ),
              ProjectStatusPageView(
                project: project,
              ),
              ProjectFundingPageView(
                project: project,
              ),
              ProjectLocationPageView(
                project: project,
              ),
              ProjectAttachmentsPageView(
                project: project,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
