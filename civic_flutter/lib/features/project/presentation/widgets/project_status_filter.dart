

import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectStatusFilter extends ConsumerWidget {
  const ProjectStatusFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectWidgetsNotifier =
        ref.watch(projectScreenWidgetsProvider.notifier);
    final projectWidgetsState = ref.watch(projectScreenWidgetsProvider);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...projectStatus.asMap().entries.map((entry) {
            final index = entry.key;
            final status = entry.value;
            return ProjectTextWithCheckbox(
              text: status,
              index: index,
              checkboxValue: projectWidgetsState.status == status,
              onChanged: (value) {
                projectWidgetsNotifier.setStatus(status);
              },
              onTap: () {
                projectWidgetsNotifier.setStatus(status);
              },
              items: projectStatus,
            );
          }),
          const FilterColumnDivider(),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppTextField(
                    textController: projectWidgetsState.statusFromController!,
                    validator: (value) => null,
                    hintText: '10%',
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      projectWidgetsNotifier.setStatusFromAmount(
                        value ?? '',
                      );
                    },
                    prefixIcon: Iconsax.percentage_square,
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).textTheme.bodySmall!.color!,
                        ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text(
                    '--',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AppTextField(
                    textController: projectWidgetsState.statusToController!,
                    validator: (value) => null,
                    hintText: '50%',
                    onChanged: (value) {
                      projectWidgetsNotifier.setStatusToAmount(
                        value ?? '',
                      );
                    },
                    textInputType: TextInputType.number,
                    prefixIcon: Iconsax.percentage_square5,
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).textTheme.bodySmall!.color!,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
