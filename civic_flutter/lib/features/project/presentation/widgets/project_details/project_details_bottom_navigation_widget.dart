import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProjectDetailsBottomNavigationWidget extends StatelessWidget {
  const ProjectDetailsBottomNavigationWidget({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    final canVet = ProjectHelperFunctions.canVet(
      project.startDate!,
      project.endDate!,
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 5),
      child: Row(
        spacing: 10,
        children: [
          if (canVet)
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
                      canVet ? Colors.blue : TColors.primary,
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
