import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_selected_locations.dart';
import 'package:civic_flutter/core/widgets/create_content/create_content_selected_tags.dart';
import 'package:flutter/material.dart';

class CreateContentLocationsAndTaggedUsers extends StatelessWidget {
  const CreateContentLocationsAndTaggedUsers({
    super.key,
    required this.locations,
    required this.taggedUsers,
  });

  final List<AWSPlaces> locations;
  final List<UserRecord> taggedUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(
          TSizes.sm,
        ),
      ),
      child: Column(
        children: [
          if (locations.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                right: TSizes.md,
              ),
              child: CreateContentSelectedLocations(
                locations: locations,
                showRemoveLocations: false,
                height: 40,
                showTopBorder: false,
              ),
            ),
          if (locations.isNotEmpty &&
              taggedUsers.isNotEmpty)
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Divider(
                height: 0,
              ),
            ),
          if (taggedUsers.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.md,
                bottom: locations.isNotEmpty ? TSizes.sm : 0,
              ),
              child: CreateContentSelectedTags(
                showRemoveTags: false,
                tags: taggedUsers,
                height: locations.isEmpty ? 40 : 20,
                showTopBorder: false,
              ),
            ),
        ],
      ),
    );
  }
}
