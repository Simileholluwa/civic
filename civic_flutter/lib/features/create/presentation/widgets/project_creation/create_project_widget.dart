import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateProjectWidget extends ConsumerWidget {
  const CreateProjectWidget({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(projectPageControllerProvider);
    final currentPageNotifier = ref.read(projectCurrentPageProvider.notifier);
    return Column(
      children: [
        const ProjectProgressIndicator(),
        const Padding(
          padding: EdgeInsets.only(
            bottom: 4,
          ),
          child: Divider(height: 0),
        ),
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (value) =>
                currentPageNotifier.setCurrentPage = value,
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
