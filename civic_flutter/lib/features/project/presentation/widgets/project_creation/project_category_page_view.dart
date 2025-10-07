import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectCategoryPageView extends ConsumerWidget {
  const ProjectCategoryPageView({
    required this.project, super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCreationSate = ref.watch(projectProviderProvider(project));
    final projectNotifier = ref.watch(projectProviderProvider(project).notifier);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose a category and subcategory most suitable for this project.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          ProjectCategoryDropdown(
            hintText: 'Project category',
            dropdownItems: projectCategories.keys.toList(),
            value: projectCreationSate.projectCategory,
            onChanged: projectNotifier.setProjectCategory,
          ),
          const SizedBox(height: 20),
          ProjectCategoryDropdown(
            hintText: 'Project subcategory',
            dropdownItems:
                ProjectHelperFunctions.getSubcategories(projectCreationSate.projectCategory),
            value: projectCreationSate.projectSubCategory,
            onChanged: projectNotifier.setProjectSubCategory,
          ),
        ],
      ),
    );
  }
}
