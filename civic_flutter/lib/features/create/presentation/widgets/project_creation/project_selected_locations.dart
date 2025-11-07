import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectSelectedLocations extends ConsumerWidget {
  const ProjectSelectedLocations({
    required this.project,
    required this.isVirtual,
    required this.isPhysical,
    super.key,
  });

  final bool isPhysical;
  final bool isVirtual;
  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final virtualLocations = ref.watch(
      createProjectNotifProvider(project).select(
        (s) => s.virtualLocations ?? <String>[],
      ),
    );
    final physicalLocations = ref.watch(
      createProjectNotifProvider(project).select(
        (s) => s.physicalLocations,
      ),
    );
    final projectNotifier =
        ref.read(createProjectNotifProvider(project).notifier);
    List<dynamic>? locations;
    if (isVirtual) {
      locations = virtualLocations;
    }
    if (isPhysical) {
      locations = physicalLocations;
    }
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
                        ? (locations![index] as AWSPlaces).place
                        : '${locations![index]}',
                  ),
                  prefixIcon: isVirtual ? Iconsax.link : Iconsax.location,
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
                  if (isVirtual)
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: TColors.primary.withValues(alpha: 0.1),
                        borderRadius:
                            BorderRadius.circular(TSizes.inputFieldRadius),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                        ),
                        onPressed: () async {
                          if (isVirtual) {
                            await virtualLinkDialog(
                              context: context,
                              project: project,
                              index: index,
                              link: locations![index] as String,
                            );
                          }
                        },
                      ),
                    ),
                  if (isVirtual)
                    const SizedBox(
                      width: TSizes.md,
                    ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: TColors.primary.withValues(alpha: 0.1),
                      borderRadius:
                          BorderRadius.circular(TSizes.inputFieldRadius),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Iconsax.trash,
                        color: TColors.secondary,
                      ),
                      onPressed: () {
                        if (isVirtual) {
                          projectNotifier.removeVirtualLocation(
                            virtualLocations[index],
                          );
                        }
                        if (isPhysical) {
                          projectNotifier.removePhysicalLocation(
                            physicalLocations[index],
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
