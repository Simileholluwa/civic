import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_quick_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContentTagsAndLocations extends StatelessWidget {
  const ContentTagsAndLocations({
    super.key,
    required this.tags,
    required this.locations,
    this.hasTags = false,
    this.hasLocations = false,
  });

  final List<UserRecord> tags;
  final List<AWSPlaces> locations;
  final bool hasTags;
  final bool hasLocations;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        spacing: 10,
        children: [
          if (hasTags)
            ProjectQuickDetailWidget(
              icon: Iconsax.tag5,
              title: tags.length == 1
                  ? '${tags.first.userInfo!.userName}'
                  : tags.length == 2
                      ? '${tags.first.userInfo!.userName} and 1 other'
                      : '${tags.first.userInfo!.userName} and ${tags.length - 1} others',
              color: Colors.blue,
              textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 12,
                  ),
            ),
          if (hasLocations)
            ProjectQuickDetailWidget(
              icon: Iconsax.location5,
              title: locations.length == 1
                  ? locations.first.place
                  : tags.length == 2
                      ? '${locations.first.place} and 1 other'
                      : '${locations.first.place} and ${locations.length - 1} others',
              color: Colors.orange,
              textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 12,
                  ),
            ),
        ],
      ),
    );
  }
}
