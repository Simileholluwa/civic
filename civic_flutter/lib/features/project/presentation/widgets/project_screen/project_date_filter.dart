import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectDateFilter extends ConsumerWidget {
  const ProjectDateFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectWidgetState = ref.watch(projectScreenWidgetsProvider);
    final projectWidgetsNotifier =
        ref.watch(projectScreenWidgetsProvider.notifier);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 5, 18, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProjectDateFilterChips(
            isExpanded: projectWidgetState.isStartDateExpanded,
            filterHeading: 'Start date',
            filterStrings: startDateFilters.keys.toList(),
            onHeadingTap: projectWidgetsNotifier.toggleStartDate,
            isStart: true,
          ),
          const Divider(
            height: 0,
            endIndent: 5,
          ),
          ProjectDateFilterChips(
            isExpanded: projectWidgetState.isEndDateExpanded,
            filterHeading: 'End date',
            filterStrings: endDateFilters.keys.toList(),
            onHeadingTap: projectWidgetsNotifier.toggleEndDate,
            isEnd: true,
          ),
          const Divider(
            height: 0,
            endIndent: 5,
          ),
          ProjectDateFilterChips(
            isExpanded: projectWidgetState.isPublishedDateExpanded,
            filterHeading: 'Published date',
            filterStrings: publishDateFilters.keys.toList(),
            onHeadingTap: projectWidgetsNotifier.togglePublishedDate,
            isPublished: true,
          ),
        ],
      ),
    );
  }
}
