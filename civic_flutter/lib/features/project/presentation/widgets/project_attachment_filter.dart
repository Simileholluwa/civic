
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectAttachmentFilter extends ConsumerWidget {
  const ProjectAttachmentFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectWidgetsNotifier =
        ref.watch(projectScreenWidgetsProvider.notifier);
    final projectWidgetsState = ref.watch(projectScreenWidgetsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...attachments.keys.toList().asMap().entries.map(
            (entry) {
              final index = entry.key;
              final attachment = entry.value;
              return ProjectTextWithCheckbox(
                text: attachment,
                index: index,
                checkboxValue: projectWidgetsState.selectedAttachments ==
                    attachments[attachment],
                onChanged: (value) {
                  projectWidgetsNotifier.selectAttachment(
                    attachments[attachment]!,
                  );
                },
                onTap: () {
                  projectWidgetsNotifier.selectAttachment(
                    attachments[attachment]!,
                  );
                },
                items: attachments.keys.toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
