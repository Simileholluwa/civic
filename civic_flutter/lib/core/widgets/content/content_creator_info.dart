import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/presentation/widgets/project_screen/project_quick_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ContentCreatorInfo extends StatelessWidget {
  const ContentCreatorInfo({
    required this.creator,
    required this.timeAgo,
    super.key,
    this.radius = 25,
    this.showPoliticalStatus = true,
  });

  final UserRecord creator;
  final String timeAgo;
  final double radius;
  final bool showPoliticalStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () async {
                await context.push(
                  '/profile/${creator.id}',
                );
              },
              child: CircleAvatar(
                radius: radius,
                backgroundImage: CachedNetworkImageProvider(
                  creator.userInfo!.imageUrl!,
                ),
              ),
            ),
            CreatorNameAndAccountInfo(
              creator: creator,
              showPoliticalStatus: showPoliticalStatus,
            ),
          ],
        ),
        Text(
          timeAgo,
          style: Theme.of(context).textTheme.labelMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class CreatorNameAndAccountInfo extends StatelessWidget {
  const CreatorNameAndAccountInfo({
    required this.creator,
    super.key,
    this.showPoliticalStatus = true,
  });

  final UserRecord creator;
  final bool showPoliticalStatus;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 3,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                THelperFunctions.getFullName(
                  creator.firstName!,
                  creator.middleName,
                  creator.lastName!,
                ),
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if (showPoliticalStatus) UserQuickDetails(creator: creator),
      ],
    );
  }
}

class UserQuickDetails extends StatelessWidget {
  const UserQuickDetails({
    required this.creator,
    super.key,
    this.alignment = MainAxisAlignment.start,
  });

  final UserRecord creator;
  final MainAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      spacing: 10,
      children: [
        ProjectQuickDetailWidget(
          size: 20,
          icon: Iconsax.shield_security2,
          title: creator.politicalStatus!.index == 0
              ? 'Current Leader'
              : creator.politicalStatus!.index == 1
                  ? 'Former Leader'
                  : creator.politicalStatus!.index == 2
                      ? 'Aspiring Leader'
                      : 'Concerned Citizen',
          color: TColors.primary,
          textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 12,
              ),
        ),
        ProjectQuickDetailWidget(
          size: 20,
          icon: Iconsax.people5,
          title: '${THelperFunctions.humanizeNumber(
            creator.followers!.length,
          )} followers',
          color: Colors.blue,
          textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontSize: 12,
              ),
        ),
      ],
    );
  }
}
