import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectDateFilterChips extends ConsumerWidget {
  const ProjectDateFilterChips({
    required this.filterHeading,
    required this.filterStrings,
    required this.isExpanded,
    required this.onHeadingTap,
    this.isEnd = false,
    this.isStart = false,
    this.isPublished = false,
    super.key,
  });

  final String filterHeading;
  final List<String> filterStrings;
  final bool isEnd;
  final bool isExpanded;
  final bool isPublished;
  final bool isStart;
  final VoidCallback onHeadingTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectWidgetsNotifier =
        ref.watch(projectScreenWidgetsProvider.notifier);
    final projectWidgetsState = ref.watch(projectScreenWidgetsProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            filterHeading,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          contentPadding: EdgeInsets.zero,
          trailing: Icon(
            isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
            color: TColors.primary,
            size: 30,
          ),
          onTap: onHeadingTap,
        ),
        if (isExpanded)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            child: Wrap(
              spacing: 15,
              runSpacing: 5,
              children: [
                ...filterStrings.map((entry) {
                  return FilterChip(
                    label: Text(
                      entry,
                    ),
                    selected: isStart
                        ? projectWidgetsState.selectedStartDate
                                ?.containsKey(entry) ??
                            false
                        : isEnd
                            ? projectWidgetsState.selectedEndDate
                                    ?.containsKey(entry) ??
                                false
                            : projectWidgetsState.selectedPublishedDate
                                    ?.containsKey(entry) ??
                                false,
                    onSelected: (value) async {
                      if (entry == 'Custom range') {
                        final picked =
                            await projectFilterDateRangePicker(context);
                        if (picked != null) {
                          isStart
                              ? projectWidgetsNotifier.setStartDate(
                                  {
                                    'Custom range': picked,
                                  },
                                )
                              : isEnd
                                  ? projectWidgetsNotifier.setEndDate(
                                      {
                                        'Custom range': picked,
                                      },
                                    )
                                  : projectWidgetsNotifier.setPublishedDate(
                                      {
                                        'Custom range': picked,
                                      },
                                    );
                        }
                      } else {
                        isStart
                            ? projectWidgetsNotifier.setStartDate(
                                {
                                  entry: [
                                    startDateFilters[entry]!.start,
                                    startDateFilters[entry]!.end,
                                  ],
                                },
                              )
                            : isEnd
                                ? projectWidgetsNotifier.setEndDate(
                                    {
                                      entry: [
                                        endDateFilters[entry]!.start,
                                        endDateFilters[entry]!.end,
                                      ],
                                    },
                                  )
                                : projectWidgetsNotifier.setPublishedDate(
                                    {
                                      entry: [
                                        publishDateFilters[entry]!.start,
                                        publishDateFilters[entry]!.end,
                                      ],
                                    },
                                  );
                      }
                    },
                  );
                }),
              ],
            ),
          ),
      ],
    );
  }
}
