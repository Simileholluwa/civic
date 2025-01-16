import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectFilterButtons extends ConsumerWidget {
  const ProjectFilterButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectWidgetsState = ref.watch(projectScreenWidgetsProvider);
    final projectWidgetsNotifier =
        ref.watch(projectScreenWidgetsProvider.notifier);
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: projectWidgetsState.isActiveFilter ? 1 : 0,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  projectWidgetsNotifier.toggleFilter();
                },
                child: const Text(
                  'Cancel',
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Apply filter',
                  style: const TextStyle().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                  foregroundColor: TColors.textWhite,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
