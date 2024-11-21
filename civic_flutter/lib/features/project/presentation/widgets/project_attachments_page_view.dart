import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_page_provider.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_attachments_tab_keep_alive.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_pdf_attachment_tab_view.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_video_attachment_tab_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_image_attachments_tab_view.dart';
import 'package:flutter/material.dart';

class ProjectAttachmentsPageView extends ConsumerWidget {
  const ProjectAttachmentsPageView({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(projectTabControllerProvider);
    final isDark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TabBar(
          controller: tabController,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelColor: isDark ? TColors.textWhite : TColors.dark,
          unselectedLabelColor:
              isDark ? TColors.darkerGrey : TColors.darkGrey,
          unselectedLabelStyle:
              Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
          labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
          indicatorColor: isDark ? TColors.textWhite : TColors.dark,
          padding: const EdgeInsets.only(
            left: TSizes.xs - 1,
            top: 0,
            bottom: 0,
          ),
          indicatorWeight: 4,
          tabs: const [
            Tab(text: 'IMAGES'),
            Tab(text: 'PDFs'),
            Tab(text: 'VIDEO'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Include images, PDFs, video or all to help your constituents understand your project better.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 17,
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              ProjectImageAttachmentsTabView(
                project: project,
              ),
              ProjectPDFAttachmentsTabView(
                project: project,
              ),
              KeepAliveWrapper(
                child: ProjectVideoAttachmentTabView(
                  project: project,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
