import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_quick_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContentEngagementTagsAndLocations extends StatelessWidget {
  const ContentEngagementTagsAndLocations({
    super.key,
    required this.tags,
    required this.locations,
    this.hasTags = false,
    this.hasLocations = false,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.numberOfReposts,
  });

  final List<UserRecord> tags;
  final List<AWSPlaces> locations;
  final bool hasTags;
  final bool hasLocations;
  final String numberOfLikes;
  final String numberOfComments;
  final String numberOfReposts;

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
          ProjectQuickDetailWidget(
            icon: Iconsax.chart_15,
            title:
                '$numberOfLikes ${numberOfLikes == '1' ? 'Like' : 'Likes'} • $numberOfComments ${numberOfComments == '1' ? 'Comment' : 'Comments'} • $numberOfReposts ${numberOfReposts == '1' ? 'Repost' : 'Reposts'}',
            color: Colors.purple,
            textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 12,
                ),
          ),
          if (hasTags)
            ProjectQuickDetailWidget(
              icon: Iconsax.tag5,
              title: tags.length == 1
                  ? 'With ${tags.first.userInfo!.userName}'
                  : tags.length == 2
                      ? 'With ${tags.first.userInfo!.userName} and 1 other'
                      : 'With ${tags.first.userInfo!.userName} and ${tags.length - 1} others',
              color: Colors.blue,
              textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 12,
                  ),
            ),
          if (hasLocations)
            ProjectQuickDetailWidget(
              icon: Iconsax.location5,
              title: locations.length == 1
                  ? 'At ${locations.first.place}'
                  : tags.length == 2
                      ? 'At ${locations.first.place} and 1 other'
                      : 'At ${locations.first.place} and ${locations.length - 1} others',
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
