import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

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
    final pageController = ref.watch(projectPageControllerProvider);
    final currentPageNotifier = ref.watch(projectCurrentPageProvider.notifier);
    final currentPageState = ref.watch(projectCurrentPageProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const ProjectProgressIndicator(),
        Padding(
          padding: const EdgeInsets.only(bottom: 4,),
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
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: TSizes.sm,
          ),
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 5),
          decoration: BoxDecoration(
            color: TColors.warning.withValues(alpha: .1),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Iconsax.warning_2,
                color: TColors.warning,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                currentPageState == 3
                    ? 'All except funding note are required.'
                    : currentPageState == 4
                        ? 'Provide at least one location'
                        : currentPageState == 5
                            ? 'Provide at least one image.'
                            : 'All fields are required.',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: TColors.warning,
                    ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
