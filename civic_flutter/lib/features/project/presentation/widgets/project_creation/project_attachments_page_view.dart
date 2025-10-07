import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectAttachmentsPageView extends ConsumerWidget {
  const ProjectAttachmentsPageView({
    required this.project, super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(projectTabControllerProvider);
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTabBarDesign(
            tabController: tabController,
            tabs: const [
              Tab(text: 'IMAGES'),
              Tab(text: 'PDFs'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Include images, and or PDFs to help your constituents understand your '
              'project better.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 17,
                    color: Theme.of(context).textTheme.bodySmall!.color,
                  ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 500,
            ),
            child: TabBarView(
              controller: tabController,
              children: [
                ProjectImageAttachmentsTabView(
                  project: project,
                ),
                ProjectPDFAttachmentsTabView(
                  project: project,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
