import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/current_location_data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class SelectedLocationsWidget extends StatelessWidget {
  const SelectedLocationsWidget({
    super.key, required this.locations, this.showRemoveLocations = true, this.height = 50,
  });

  final List<AWSPlaces> locations;
  final bool showRemoveLocations;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      
      return InkWell(
        onTap: showRemoveLocations ? () =>
            THelperFunctions.selectLocationBottomSheet(context: context) : null,
        child: Ink(
          height: height,
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    'At ${locations.first.place} ${locations.length == 1 ? '' : 'and ${locations.length - 1 == 1 ? '1 other' : '${locations.length - 1} others'}'}',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: TColors.primary,
                        ),
                  ),
                ),
              ),
              if (showRemoveLocations)
                Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 14,
                  ),
                  child: GestureDetector(
                    onTap: ref.read(selectLocationsProvider.notifier).removeAllLocations,
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
