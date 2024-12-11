import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
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
    final projectCreationSate = ref.watch(projectProviderProvider(project));
    final projectNotifier =
        ref.watch(projectProviderProvider(project).notifier);
    List<dynamic>? locations;
    if (isManual) locations = projectCreationSate.manualLocations ?? <String>[];
    if (isVirtual) locations = projectCreationSate.virtualLocations ?? <String>[];
    if (isPhysical) locations = projectCreationSate.physicalLocations ?? <AWSPlaces>[];
    return Flexible(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(
                child: AppTextField(
                  textController: TextEditingController(
                    text: isPhysical
                        ? locations![index].place
                        : locations![index],
                  ),
                  prefixIcon: isManual
                      ? Iconsax.edit
                      : isVirtual
                          ? Iconsax.link
                          : Iconsax.location,
                  maxLines: 1,
                  validator: null,
                  style: Theme.of(context).textTheme.bodyMedium,
                  readOnly: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(TSizes.sm),
                    borderSide: const BorderSide(
                      color: TColors.darkGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: TSizes.md,
              ),
              Row(
                children: [
                  if (isManual || isVirtual)
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: TColors.primary.withOpacity(0.1),
                        borderRadius:
                            BorderRadius.circular(TSizes.inputFieldRadius),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                        ),
                        onPressed: () {
                          if (isManual) {
                            manualLocationDialog(
                              context: context,
                              project: project,
                              index: index,
                              location: locations![index],
                            );
                          }
                          if (isVirtual) {
                            virtualLinkDialog(
                              context: context,
                              project: project,
                              index: index,
                              link: locations![index],
                            );
                          }
                        },
                      ),
                    ),
                  if (isManual || isVirtual)
                    const SizedBox(
                      width: TSizes.md,
                    ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: TColors.primary.withOpacity(0.1),
                      borderRadius:
                          BorderRadius.circular(TSizes.inputFieldRadius),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Iconsax.trash,
                        color: TColors.secondary,
                      ),
                      onPressed: () {
                        if (isManual) {
                          projectNotifier.removeManualLocation(
                            projectCreationSate.manualLocations![index],
                          );
                        }
                        if (isVirtual) {
                          projectNotifier.removeVirtualLocation(
                            projectCreationSate.virtualLocations![index],
                          );
                        }
                        if (isPhysical) {
                          projectNotifier.removePhysicalLocation(
                            projectCreationSate.physicalLocations![index],
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          );
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
