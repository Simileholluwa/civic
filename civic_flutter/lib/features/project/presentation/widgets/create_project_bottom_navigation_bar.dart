import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore_for_file: use_build_context_synchronously

import 'package:civic_flutter/features/project/presentation/providers/project_page_provider.dart';
import 'package:flutter/material.dart';

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
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: currentPage == 0
                ? null
                : () => pageControllerNotifier.previousPage(),
            child: const Text("Previous"),
          ),
          ElevatedButton(
            onPressed: currentPage == 4
                ? null
                : () => pageControllerNotifier.nextPage(),
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }
}
