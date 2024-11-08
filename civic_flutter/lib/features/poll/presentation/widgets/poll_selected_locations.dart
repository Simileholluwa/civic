import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/features/poll/presentation/helper/poll_helper_functions.dart';
import 'package:civic_flutter/features/poll/presentation/providers/poll_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class PollSelectedLocations extends ConsumerWidget {
  const PollSelectedLocations({
    super.key,
    required this.locations,
    this.showRemoveLocations = true,
    this.height = 50,
    this.showTopBorder = true,
    this.poll,
  });

  final List<AWSPlaces> locations;
  final bool showRemoveLocations;
  final double height;
  final bool showTopBorder;
  final Poll? poll;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollNotifier = ref.watch(pollsOptionsProvider(poll).notifier);
    return Consumer(builder: (context, ref, _) {
      return InkWell(
        onTap: showRemoveLocations
            ? () => PollHelperFunctions.selectLocationBottomSheet(
                context: context, poll: poll!)
            : null,
        child: Ink(
          height: height,
          decoration: BoxDecoration(
            border: showTopBorder
                ? Border(
                    top: BorderSide(
                      color: Theme.of(context).dividerColor,
                    ),
                  )
                : null,
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
                    onTap: pollNotifier.removeAllLocations,
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
