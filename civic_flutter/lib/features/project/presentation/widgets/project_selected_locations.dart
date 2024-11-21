import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/app/app_text_field.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectSelectedLocations extends ConsumerWidget {
  const ProjectSelectedLocations({
    super.key,
    required this.project,
    required this.isManual,
    required this.isVirtual,
    required this.isPhysical,
  });

  final Project project;
  final bool isManual;
  final bool isVirtual;
  final bool isPhysical;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectState = ref.watch(projectProviderProvider(project));
    List<dynamic>? locations;
    if (isManual) locations = projectState.manualLocations ?? <String>[];
    if (isVirtual) locations = projectState.virtualLocations ?? <String>[];
    if (isPhysical) locations = projectState.physicalLocations ?? <AWSPlaces>[];
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return AppTextField(
            textController: TextEditingController(
              text: isPhysical ? locations![index].place : locations![index],
            ),
            prefixIcon: isManual
                ? Iconsax.edit
                : isVirtual
                    ? Iconsax.link
                    : Iconsax.location,
            maxLines: 1,
            validator: null,
            enabled: false,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).disabledColor,
            ),
            readOnly: isManual || isVirtual ? false : true,
          );
          // return Chip(
          //   label: Text(
          //     locations![index],
          //     style: Theme.of(context).textTheme.bodyMedium,
          //     overflow: TextOverflow.ellipsis,
          //   ),
          //   avatar: Icon(
          //     isManual
          //         ? Iconsax.edit
          //         : isVirtual
          //             ? Iconsax.link
          //             : Iconsax.location,
          //     color: TColors.primary,
          //   ),
          //   elevation: 0,
          //   surfaceTintColor: Colors.transparent,
          //   //padding: EdgeInsets.zero,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(
          //       100,
          //     ),
          //   ),
          //   backgroundColor: Colors.transparent,
          //   deleteIcon: const Icon(
          //     Icons.clear,
          //     color: TColors.secondary,
          //   ),
          //   // onDeleted: () => projectNotifier.removeManualLocation(
          //   //   projectState.manualLocations![index],
          //   // ),
          // );
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: TSizes.md,
          );
        },
        itemCount: locations?.length ?? 0,
      ),
    );
  }
}
