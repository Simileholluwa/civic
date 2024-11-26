import 'package:civic_flutter/features/project/presentation/providers/project_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/presentation/helpers/project_data.dart';
import 'package:civic_flutter/features/project/presentation/helpers/project_helper_functions.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_category_dropdown.dart';
import 'package:flutter/material.dart';

class ProjectCategoryPageView extends ConsumerWidget {
  const ProjectCategoryPageView({
    super.key,
    required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectProviderProvider(project));
    final projectNotifier =
        ref.watch(projectProviderProvider(project).notifier);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose a category and subcategory most suitable for this project.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 17,
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                ),
          ),
          const SizedBox(height: 20),
          ProjectCategoryDropdown(
            hintText: 'Project category',
            dropdownItems: projectCategories.keys.toList(),
            value: projectState.projectCategory,
            onChanged: (String? value) {
              projectNotifier.setProjectCategory(
                value,
              );
            },
          ),
          const SizedBox(height: 20),
          ProjectCategoryDropdown(
            hintText: 'Project subcategory',
            dropdownItems: ProjectHelperFunctions.getSubcategories(
              projectState.projectCategory,
            ),
            value: projectState.projectSubCategory,
            onChanged: (String? value) {
              projectNotifier.setProjectSubCategory(
                value,
              );
            },
          ),
        ],
      ),
    );
  }
}
