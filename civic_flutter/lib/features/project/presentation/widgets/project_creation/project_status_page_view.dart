import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

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
            "Select the start and end date of the project. Its status will be automatically determined.",
            style: Theme.of(context).textTheme.bodyMedium!,
          ),
          const SizedBox(height: 20),
          AppTextField(
            textController: projectCreationSate.startDateController,
            prefixIcon: Iconsax.calendar_1,
            hintText: 'Start date',
            readOnly: true,
            onTap: () async {
              final pickedDate =
                  await ProjectHelperFunctions.pickProjectStartOrDate(
                context,
                'Select start date',
                null,
                null,
              );
              if (pickedDate != null) {
                projectNotifier.setStartDate(pickedDate);
                projectCreationSate.startDateController.text =
                    DateFormat('MMM d, y').format(
                  pickedDate,
                );
              }
            },
            validator: (value) => null,
          ),
          const SizedBox(height: 20),
          AppTextField(
            textController: projectCreationSate.endDateController,
            prefixIcon: Iconsax.calendar5,
            hintText: 'End date',
            readOnly: true,
            onTap: () async {
              if (projectCreationSate.startDateController.text.isEmpty) {
                TToastMessages.errorToast('Please select a start date first');
                return;
              }
              final pickedDate =
                  await ProjectHelperFunctions.pickProjectStartOrDate(
                context,
                'Select end date',
                projectCreationSate.startDate!.add(
                  Duration(
                    days: 1,
                  ),
                ),
                projectCreationSate.startDate!.add(
                  Duration(
                    days: 1,
                  ),
                ),
              );
              if (pickedDate != null) {
                projectNotifier.setEndDate(pickedDate);
                projectCreationSate.endDateController.text =
                    DateFormat('MMM d, y').format(
                  pickedDate,
                );
              }
            },
            validator: (value) => null,
          ),
        ],
      ),
    );
  }
}
