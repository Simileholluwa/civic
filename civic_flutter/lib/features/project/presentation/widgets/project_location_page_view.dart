import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/features/project/presentation/helpers/project_helper_functions.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_provider.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_location_options.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_manual_location_dialog.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_selected_locations.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_virtual_link_dialog.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Make it effortless to find where this project is located. Whether physical or virtual or both.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 17,
                    color: Theme.of(context).textTheme.bodySmall!.color!,
                  ),
            ),
          ),
          Row(
            children: [
              ProjectLocationOptions(
                onTap: projectState.canAddLocations
                    ? () {
                        manualLocationDialog(
                          context: context,
                          project: _project,
                        );
                      }
                    : () => TToastMessages.infoToast(
                          'You have reached the maximum number of location entries.',
                        ),
                text: "Manually type the project's location",
                icon: Iconsax.edit,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
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
                          'You have reached the maximum number of location entries.',
                        ),
                text: 'Physical location ',
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
                          'You have reached the maximum number of location entries.',
                        ),
                text: 'Virtual location',
                icon: Iconsax.link,
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.md,
          ),
          if (projectState.manualLocations != null)
            ProjectSelectedLocations(
              project: _project,
              isManual: true,
              isVirtual: false,
              isPhysical: false,
            ),
          if (projectState.manualLocations != null &&
              projectState.virtualLocations != null)
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
          if (projectState.virtualLocations != null &&
              projectState.physicalLocations != null)
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
      ),
    );
  }
}
