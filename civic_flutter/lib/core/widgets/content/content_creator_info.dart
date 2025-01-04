import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContentCreatorInfo extends StatelessWidget {
  const ContentCreatorInfo({
    super.key,
    required this.creator,
    required this.timeAgo,
    required this.numberOfViews,
  });

  final UserRecord creator;
  final String timeAgo;
  final String numberOfViews;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundImage: CachedNetworkImageProvider(
                creator.userInfo!.imageUrl!,
              ),
            ),
            AppUserPLStatusIcon(
              plStatusIndex: creator.politicalStatus.index,
            ),
          ],
        ),
        const SizedBox(
          width: 15,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      creator.userInfo!.fullName ?? creator.userInfo!.userName!,
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (creator.verifiedAccount)
                    const Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Iconsax.verify5,
                          color: TColors.primary,
                          size: 19,
                        ),
                      ],
                    ),
                ],
              ),
              Text(
                creator.bio,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 13,
                    ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                '@${creator.userInfo!.userName} • $timeAgo • $numberOfViews views',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      fontSize: 13,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
