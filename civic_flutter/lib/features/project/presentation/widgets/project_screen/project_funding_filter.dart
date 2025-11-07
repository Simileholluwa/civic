import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectFundingFilter extends ConsumerWidget {
  const ProjectFundingFilter({
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
        mainAxisSize: MainAxisSize.min,
        children: [
          ...fundingSources.keys.toList().asMap().entries.map(
            (entry) {
              final index = entry.key;
              final source = entry.value;
              return ProjectTextWithCheckbox(
                index: index,
                text: source,
                onTap: () {
                  projectWidgetsNotifier.toggleFundingSelections(
                    source,
                  );
                },
                checkboxValue:
                    projectWidgetsState.selectedFunding.contains(source),
                onChanged: (value) {
                  projectWidgetsNotifier.toggleFundingSelections(
                    source,
                  );
                },
                items: fundingSources.keys.toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
