import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class QuotedPostCreatorInfo extends StatelessWidget {
  const QuotedPostCreatorInfo({
    required this.owner,
    required this.dateCreated,
    super.key,
  });

  final UserRecord owner;
  final DateTime dateCreated;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 12,
          backgroundImage: CachedNetworkImageProvider(
            owner.userInfo!.imageUrl!,
          ),
        ),
        Expanded(
          child: Text(
            THelperFunctions.getFullName(
              owner.firstName!,
              owner.middleName,
              owner.lastName!,
            ),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Text(
            THelperFunctions.humanizeDateTime(
              dateCreated,
            ),
            style: Theme.of(context).textTheme.labelMedium,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
