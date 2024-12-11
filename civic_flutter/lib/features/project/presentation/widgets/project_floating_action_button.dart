

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProjectFloatingActionButton extends ConsumerWidget {
  const ProjectFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectWidgetsState = ref.watch(projectScreenWidgetsProvider);
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: projectWidgetsState.isActiveFilter ? 0 : 1,
      child: GestureDetector(
        onTap: () {
          context.push(
            AppRoutes.createProject,
            extra: {
              'id': 0,
            },
          );
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            color: TColors.primary,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }
}
