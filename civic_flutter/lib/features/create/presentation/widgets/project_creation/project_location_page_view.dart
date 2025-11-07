import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectLocationPageView extends ConsumerWidget {
  const ProjectLocationPageView({
    required this.project,
    super.key,
  });
  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final canAddLocations = ref.watch(
      createProjectNotifProvider(project).select(
        (s) => s.canAddLocations,
      ),
    );
    final hasVirtualLocations = ref.watch(
      createProjectNotifProvider(project).select(
        (s) => (s.virtualLocations ?? const <String>[]).isNotEmpty,
      ),
    );
    final hasPhysicalLocations = ref.watch(
      createProjectNotifProvider(project).select(
        (s) => s.physicalLocations.isNotEmpty,
      ),
    );
    return Column(
      spacing: 20,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Text(
            'Make it effortless to find where this project '
            'is located. Whether physical or virtual or both.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 17,
                  color: Theme.of(context).textTheme.bodySmall!.color,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ProjectLocationOptions(
                  onTap: canAddLocations
                      ? () async {
                          await ProjectHelperFunctions.selectLocation(
                            context,
                            project,
                          );
                        }
                      : () => TToastMessages.infoToast(
                            'Maximum location entries reached.',
                          ),
                  text: 'Search location ',
                  icon: Iconsax.location,
                ),
              ),
              Expanded(
                child: ProjectLocationOptions(
                  onTap: canAddLocations
                      ? () async {
                          await virtualLinkDialog(
                            context: context,
                            project: project,
                          );
                        }
                      : () => TToastMessages.infoToast(
                            'Maximum location entries reached.',
                          ),
                  text: 'Virtual location',
                  icon: Iconsax.link,
                ),
              ),
            ],
          ),
        ),
        if (hasVirtualLocations)
          ProjectSelectedLocations(
            project: project,
            isVirtual: true,
            isPhysical: false,
          ),
        if (hasPhysicalLocations)
          ProjectSelectedLocations(
            project: project,
            isVirtual: false,
            isPhysical: true,
          ),
      ],
    );
  }
}
