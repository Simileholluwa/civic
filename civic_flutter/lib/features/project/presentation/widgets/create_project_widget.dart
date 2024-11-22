import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_page_provider.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_provider.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_attachments_page_view.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_category_page_view.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_funding_page_view.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_location_page_view.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_overview_page_view.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_progress_indicator.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_status_page_view.dart';
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
    final projectState = ref.watch(projectProviderProvider(_project));
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
              ref
                  .read(mediaVideoPlayerProvider(
                    projectState.projectVideoUrl,
                  ).notifier)
                  .pause();
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
