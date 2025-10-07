
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectCategoryFilter extends ConsumerWidget {
  const ProjectCategoryFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectWidgetsNotifier =
        ref.watch(projectScreenWidgetsProvider.notifier);
    final projectWidgetsState = ref.watch(projectScreenWidgetsProvider);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        16, 0, 20, 0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...projectCategories.keys.toList().asMap().entries.map(
            (entry) {
              final index = entry.key;
              final category = entry.value;
              return ProjectTextWithCheckbox(
                index: index,
                text: category,
                onTap: () {
                  projectWidgetsNotifier.toggleCategorySelections(
                    category,
                  );
                },
                checkboxValue:
                    projectWidgetsState.selectedCategories.contains(category),
                onChanged: (value) {
                  projectWidgetsNotifier.toggleCategorySelections(
                    category,
                  );
                },
                items: projectCategories.keys.toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
