import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateProjectBottomNavigationBar extends ConsumerWidget {
  const CreateProjectBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(projectCurrentPageProvider);
    final pageControllerNotifier =
        ref.watch(projectPageControllerProvider.notifier);
    return Container(
      margin: const EdgeInsets.fromLTRB(
        20,
        10,
        20,
        4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilledButton(
            onPressed:
                currentPage == 0 ? null : pageControllerNotifier.previousPage,
            child: const Text('Previous'),
          ),
          FilledButton(
            onPressed:
                currentPage == 4 ? null : pageControllerNotifier.nextPage,
            child: const Text(TTexts.tContinue),
          ),
        ],
      ),
    );
  }
}
