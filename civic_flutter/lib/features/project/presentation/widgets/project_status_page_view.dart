import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProjectStatusPageView extends ConsumerWidget {
  const ProjectStatusPageView({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCreationSate = ref.watch(projectProviderProvider(project));
    final projectNotifier =
        ref.watch(projectProviderProvider(project).notifier);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            projectCreationSate.status == projectStatus[0]
                ? 'Select when this project will start and when it is expected to end.'
                : projectCreationSate.status == projectStatus[1]
                    ? 'Select when this project started, its completion rate, and when it is expected to end.'
                    : projectCreationSate.status == projectStatus[2]
                        ? 'Select when this project started and when it ended.'
                        : 'Share insights on the status of this project with your constituents.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                ),
          ),
          const SizedBox(height: 20),
          ProjectCategoryDropdown(
            hintText: 'Project status',
            dropdownItems: projectStatus,
            value: projectCreationSate.status,
            onChanged: (String? value) {
              projectNotifier.setProjectStatus(value);
            },
          ),
          const SizedBox(height: 20),
          Visibility(
            visible: projectCreationSate.status == projectStatus[2],
            child: AppTextField(
              textController: projectCreationSate.completionRateController,
              prefixIcon: Iconsax.percentage_square,
              hintText: 'Percentage completion',
              hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).textTheme.bodySmall!.color!,
                  ),
              textInputType: TextInputType.number,
              validator: (value) => TValidator.validateEmptyText(
                'Percentage completion',
                value,
              ),
              onChanged: (value) {
                projectNotifier.setCompletionRate(value ?? '');
              },
            ),
          ),
          Visibility(
            visible: projectCreationSate.status == projectStatus[2],
            child: const SizedBox(
              height: 20,
            ),
          ),
          AppTextField(
            textController: projectCreationSate.startDateController,
            prefixIcon: Iconsax.calendar_1,
            hintText: 'Start date',
            readOnly: true,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                ),
            onTap: () async {
              final pickedDate =
                  await ProjectHelperFunctions.pickProjectStartOrDate(
                context,
                'Select start date',
              );
              if (pickedDate != null) {
                projectNotifier.setStartDate(pickedDate);
                projectCreationSate.startDateController.text = pickedDate.toString().substring(0, 11);
              }
            },
            validator: (value) => TValidator.validateStartDate(value),
          ),
          const SizedBox(height: 20),
          AppTextField(
            textController: projectCreationSate.endDateController,
            prefixIcon: Iconsax.calendar5,
            hintText: 'End date',
            readOnly: true,
            hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                ),
            onTap: () async {
              final pickedDate =
                  await ProjectHelperFunctions.pickProjectStartOrDate(
                context,
                'Select end date',
              );
              if (pickedDate != null) {
                projectNotifier.setEndDate(pickedDate);
                projectCreationSate.endDateController.text = pickedDate.toString().substring(0, 11);
              }
            },
            validator: (value) =>
                TValidator.validateEndDate(value, '12/10/2024'),
          ),
        ],
      ),
    );
  }
}
