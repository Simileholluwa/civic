import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectLocationPageView extends ConsumerWidget {
  const ProjectLocationPageView({
    super.key,
    required Project project,
  }) : _project = project;

  final Project _project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectProviderProvider(_project));
    final manualLocation = projectState.manualLocations ?? [];
    final virtualLocation = projectState.virtualLocations ?? [];
    final physicalLocation = projectState.physicalLocations ?? [];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Make it effortless to find where this project is located. Whether physical or virtual or both.',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 17,
                  color: Theme.of(context).textTheme.bodySmall!.color!,
                ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProjectLocationOptions(
                onTap: projectState.canAddLocations
                    ? () {
                        ProjectHelperFunctions.selectLocation(
                          context,
                          _project,
                        );
                      }
                    : () => TToastMessages.infoToast(
                          'Maximum location entries reached.',
                        ),
                text: 'Search location ',
                icon: Iconsax.location,
              ),
              const SizedBox(width: 10),
              ProjectLocationOptions(
                onTap: projectState.canAddLocations
                    ? () {
                        virtualLinkDialog(
                          context: context,
                          project: _project,
                        );
                      }
                    : () => TToastMessages.infoToast(
                          'Maximum location entries reached.',
                        ),
                text: 'Virtual location',
                icon: Iconsax.link,
              ),
              const SizedBox(width: 10),
              ProjectLocationOptions(
                onTap: projectState.canAddLocations
                    ? () {
                        manualLocationDialog(
                          context: context,
                          project: _project,
                        );
                      }
                    : () => TToastMessages.infoToast(
                          'Maximum location entries reached.',
                        ),
                text: "Input location",
                icon: Iconsax.edit,
              ),
            ],
          ),
        ),
        if (manualLocation.isNotEmpty ||
            virtualLocation.isNotEmpty ||
            physicalLocation.isNotEmpty)
          const SizedBox(
            height: 20,
          ),
        if (manualLocation.isNotEmpty)
          ProjectSelectedLocations(
            project: _project,
            isManual: true,
            isVirtual: false,
            isPhysical: false,
          ),
        if (manualLocation.isNotEmpty &&
            (virtualLocation.isNotEmpty || physicalLocation.isNotEmpty))
          const SizedBox(
            height: TSizes.md,
          ),
        if (projectState.virtualLocations != null)
          ProjectSelectedLocations(
            project: _project,
            isManual: false,
            isVirtual: true,
            isPhysical: false,
          ),
        if (virtualLocation.isNotEmpty &&
            physicalLocation.isNotEmpty)
          const SizedBox(
            height: TSizes.md,
          ),
        if (projectState.physicalLocations != null)
          ProjectSelectedLocations(
            project: _project,
            isManual: false,
            isVirtual: false,
            isPhysical: true,
          ),
      ],
    );
  }
}
