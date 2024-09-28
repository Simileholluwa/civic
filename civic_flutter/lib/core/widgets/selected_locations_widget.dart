import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/providers/current_location_data_provider.dart';
import 'package:civic_flutter/core/widgets/choose_location_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class SelectedLocationsWidget extends StatelessWidget {
  const SelectedLocationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final selectLocations = ref.watch(selectLocationsProvider.notifier);
      final selectedLocations = ref.watch(selectLocationsProvider);
      return InkWell(
        onTap: () async {
          await selectLocationBottomSheet(
            context: context,
          );
        },
        child: Ink(
          height: 50,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 13,
                  right: 8,
                ),
                child: Icon(
                  Iconsax.location5,
                  color: TColors.primary,
                  size: 20,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Chip(
                      label: Text(
                        selectedLocations[index].place,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: TColors.primary,
                                ),
                      ),
                      elevation: 0,
                      surfaceTintColor: Colors.transparent,
                      side: BorderSide.none,
                      labelPadding: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      deleteIcon: const Icon(
                        Icons.clear,
                        color: TColors.secondary,
                      ),
                      onDeleted: () => selectLocations.removeLocation(
                        selectedLocations[index],
                      ),
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const VerticalDivider(
                      indent: 12,
                      endIndent: 12,
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedLocations.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 8,
                ),
                child: GestureDetector(
                  onTap: selectLocations.removeAllLocations,
                  child: const Icon(
                    Iconsax.close_square5,
                    color: TColors.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
