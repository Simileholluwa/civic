import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_quick_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ContentCreatorInfo extends StatelessWidget {
  const ContentCreatorInfo({
    super.key,
    required this.creator,
    required this.timeAgo,
  });

  final UserRecord creator;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: CachedNetworkImageProvider(
            creator.userInfo!.imageUrl!,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        CreatorNameAndAccountInfo(creator: creator, timeAgo: timeAgo),
      ],
    );
  }
}

class CreatorNameAndAccountInfo extends StatelessWidget {
  const CreatorNameAndAccountInfo({
    super.key,
    required this.creator,
    required this.timeAgo,
  });

  final UserRecord creator;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 3,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
               Flexible(
                 child: Text(
                      creator.userInfo!.fullName ?? creator.userInfo!.userName!,
                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
               ),           
                Text(
                    ' • $timeAgo',
                    style: Theme.of(context).textTheme.labelMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                ProjectQuickDetailWidget(
                  size: 20,
                  icon: Iconsax.shield_security2,
                  title: creator.politicalStatus.index == 0
                      ? 'Current Leader'
                      : creator.politicalStatus.index == 1
                          ? 'Former Leader'
                          : creator.politicalStatus.index == 2
                              ? 'Aspiring Leader'
                              : 'Concerned Citizen',
                  color: TColors.primary,
                  textStyle:
                      Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontSize: 12,
                          ),
                ),
              
                if (creator.verifiedAccount)
                  ProjectQuickDetailWidget(
                    size: 20,
                    icon: Iconsax.verify5,
                    title: 'Verified',
                    color: TColors.primary,
                    textStyle:
                        Theme.of(context).textTheme.labelMedium!.copyWith(
                              fontSize: 12,
                              color: TColors.primary,
                            ),
                  )
                else
                  ProjectQuickDetailWidget(
                    size: 20,
                    icon: Iconsax.verify5,
                    title: 'Unverified',
                    color: TColors.secondary,
                    textStyle:
                        Theme.of(context).textTheme.labelMedium!.copyWith(
                              fontSize: 12,
                            ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
