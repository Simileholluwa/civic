import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectLocationFilter extends ConsumerWidget {
  const ProjectLocationFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectWidgetsNotifier =
        ref.watch(projectScreenWidgetsProvider.notifier);
    final projectWidgetsState = ref.watch(projectScreenWidgetsProvider);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        16,
        0,
        20,
        0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 15,
            ),
            child: ProjectCategoryDropdown(
              dropdownItems: statesInNigeria,
              value: projectWidgetsState.selectedState,
              onChanged: (value) {
                projectWidgetsNotifier.setSelectedState(
                  value ?? '',
                );
              },
              hintText: 'Filter by state',
            ),
          ),
          const ProjectFilterColumnDivider(),
          ProjectTextWithCheckbox(
            text: 'Virtual location only',
            index: 0,
            checkboxValue: projectWidgetsState.virtualLocation,
            onChanged: (value) {
              projectWidgetsNotifier.toggleVirtualLocation();
            },
            onTap: projectWidgetsNotifier.toggleVirtualLocation,
            items: const ['Virtual location'],
          ),
          const ProjectFilterColumnDivider(),
          Column(
            children: [
              ListTile(
                title: Text(
                  'Physical locations only',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                contentPadding: EdgeInsets.zero,
                trailing: Icon(
                  projectWidgetsState.isPhysicalLocationsExpanded
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: TColors.primary,
                  size: 30,
                ),
                onTap: projectWidgetsNotifier.togglePhysicalLocations,
              ),
              if (projectWidgetsState.isPhysicalLocationsExpanded)
                ...radiusOptions.asMap().entries.map((entry) {
                  final index = entry.key;
                  final location = entry.value;
                  return ProjectTextWithCheckbox(
                    text: 'Within $location radius',
                    index: index,
                    checkboxValue: projectWidgetsState.radiusOption == location,
                    onChanged: (value) {
                      projectWidgetsNotifier.setRadiusOption(location);
                    },
                    onTap: () {
                      projectWidgetsNotifier.setRadiusOption(location);
                    },
                    items: radiusOptions,
                  );
                }),
            ],
          ),
        ],
      ),
    );
  }
}
