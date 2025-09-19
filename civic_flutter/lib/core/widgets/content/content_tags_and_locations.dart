import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_screen/project_quick_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContentEngagementTagsAndLocations extends StatelessWidget {
  const ContentEngagementTagsAndLocations({
    super.key,
    required this.tags,
    required this.locations,
    this.hasTags = false,
    this.hasLocations = false,
    this.onTaggedUsersTap,
    this.onLocationTap,
    this.usePadding = true,
  });

  final List<UserRecord> tags;
  final List<AWSPlaces> locations;
  final bool hasTags;
  final bool hasLocations;
  final VoidCallback? onTaggedUsersTap;
  final VoidCallback? onLocationTap;
  final bool usePadding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(
        horizontal: usePadding ? 15 : 0,
      ),
      child: Row(
        spacing: 10,
        children: [
          if (hasTags)
            InkWell(
              onTap: onTaggedUsersTap,
              child: ProjectQuickDetailWidget(
                icon: Iconsax.tag5,
                title: tags.length == 1
                    ? 'With ${tags.first.userInfo!.userName}'
                    : tags.length == 2
                        ? 'With ${tags[0].userInfo!.userName} and ${tags[1].userInfo!.userName}'
                        : 'With ${tags.first.userInfo!.userName} and ${tags.length - 1} others',
                color: Colors.blue,
                textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 14,
                    ),
              ),
            ),
          if (hasLocations)
            InkWell(
              onTap: onLocationTap,
              child: ProjectQuickDetailWidget(
                icon: Iconsax.location5,
                title: locations.length == 1
                    ? 'At ${locations.first.place}'
                    : tags.length == 2
                        ? 'At ${locations.first.place} and 1 other'
                        : 'At ${locations.first.place} and ${locations.length - 1} others',
                color: Colors.orange,
                textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 14,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
