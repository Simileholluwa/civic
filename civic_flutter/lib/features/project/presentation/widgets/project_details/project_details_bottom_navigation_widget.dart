import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectDetailsBottomNavigationWidget extends ConsumerWidget {
  const ProjectDetailsBottomNavigationWidget({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectCardState = ref.watch(
      projectCardWidgetProvider(
        project,
      ),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 5),
      child: Row(
        spacing: 10,
        children: [
          if (projectCardState.canVet!)
            Expanded(
              child: SizedBox(
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    await context.push(
                      '/project/${project.id!}/vet',
                      extra: project.physicalLocations,
                    );
                  },
                  label: const Text(
                    'Vet',
                  ),
                  icon: const Icon(
                    Iconsax.medal_star5,
                    color: TColors.textWhite,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: TColors.primary,
                    foregroundColor: TColors.textWhite,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await context.push(
                    '/project/${project.id}/review',
                  );
                },
                label: const Text(
                  'Review',
                ),
                icon: const Icon(
                  Iconsax.magic_star5,
                  color: TColors.textWhite,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      projectCardState.canVet! ? Colors.blue : TColors.primary,
                  foregroundColor: TColors.textWhite,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
