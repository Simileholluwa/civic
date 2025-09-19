import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectDetailsBottomNavigationWidget extends ConsumerWidget {
  const ProjectDetailsBottomNavigationWidget({
    super.key,
    required this.project,
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
                  onPressed: () {
                    context.push(
                      '/project/${project.id!}/vet',
                      extra: project.physicalLocations,
                    );
                  },
                  label: Text(
                    'Vet',
                  ),
                  icon: Icon(
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
                onPressed: () {
                  context.push(
                    '/project/${project.id}/review',
                  );
                },
                label: Text(
                  'Review',
                ),
                icon: Icon(
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
