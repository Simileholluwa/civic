import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectCostFilter extends ConsumerWidget {
  const ProjectCostFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectWidgetsNotifier =
        ref.watch(projectScreenWidgetsProvider.notifier);
    final projectWidgetsState = ref.watch(projectScreenWidgetsProvider);
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        16, 0, 20, 0
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 15),
            child: ProjectCategoryDropdown(
              dropdownItems: currencies.keys.toList(),
              value: projectWidgetsState.selectedCurrency,
              onChanged: (value) {
                projectWidgetsNotifier.setSelectedCurrency(
                  value ?? '',
                );
              },
              hintText: 'Filter by currency',
            ),
          ),
          const ProjectFilterColumnDivider(),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 20,
            ),
            child: ProjectCategoryDropdown(
              dropdownItems: currencies.keys.toList(),
              value: projectWidgetsState.costToAndFromCurrency,
              onChanged: (value) {
                projectWidgetsNotifier.setCostToAndFromCurrency(
                  value ?? '',
                );
              },
              hintText: 'Select currency',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 15,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: AppTextField(
                    textController: projectWidgetsState.costFromController!,
                    validator: (value) => null,
                    hintText: '1,000',
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      projectWidgetsNotifier.setCostFromAmount(
                        value ?? '',
                      );
                    },
                    prefixIcon: Iconsax.coin_15,
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
                    textController: projectWidgetsState.costToController!,
                    validator: (value) => null,
                    hintText: '5,000,000',
                    textInputType: TextInputType.number,
                    onChanged: (value) {
                      projectWidgetsNotifier.setCostToAmount(
                        value ?? '',
                      );
                    },
                    prefixIcon: Iconsax.coin_15,
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).textTheme.bodySmall!.color!,
                        ),
                  ),
                ),
              ],
            ),
          ),
          const ProjectFilterColumnDivider(),
          ProjectTextWithCheckbox(
            text: 'Zero cost',
            index: 0,
            checkboxValue: projectWidgetsState.zeroCost,
            onChanged: (value) {
              projectWidgetsNotifier.toggleZeroCost();
            },
            onTap: () {
              projectWidgetsNotifier.toggleZeroCost();
            },
            items: const ['Zero cost'],
          ),
        ],
      ),
    );
  }
}
