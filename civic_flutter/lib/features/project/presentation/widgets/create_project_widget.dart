import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateProjectWidget extends ConsumerStatefulWidget {
  const CreateProjectWidget({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateProjectWidgetState();
}

class _CreateProjectWidgetState extends ConsumerState<CreateProjectWidget> {
  late Project _project;

  @override
  void initState() {
    setState(() {
      _project = widget.project;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentPageNotifier = ref.watch(projectCurrentPageProvider.notifier);
    final pageController = ref.watch(projectPageControllerProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ProjectProgressIndicator(),
        const Divider(height: 0),
        Expanded(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              currentPageNotifier.setCurrentPage(index);
            },
            physics: const ClampingScrollPhysics(),
            children: [
              ProjectOverviewPageView(
                project: _project,
              ),
              ProjectCategoryPageView(
                project: _project,
              ),
              ProjectStatusPageView(
                project: _project,
              ),
              ProjectFundingPageView(
                project: _project,
              ),
              ProjectLocationPageView(
                project: _project,
              ),
              ProjectAttachmentsPageView(
                project: _project,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
