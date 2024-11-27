import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
// import 'package:iconsax/iconsax.dart';

class AppUserInfoWidget extends StatelessWidget {
  const AppUserInfoWidget({
    super.key,
    required this.onTap,
    required this.userRecord,
  });

  final VoidCallback onTap;
  final UserRecord userRecord;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Ink(
        padding: const EdgeInsets.symmetric(
          horizontal: TSizes.md,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppUserProfileImage(
              imageUrl: userRecord.userInfo!.imageUrl!,
            ),
            const SizedBox(
              width: TSizes.md,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          userRecord.userInfo!.fullName ??
                              userRecord.userInfo!.userName!,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 20,
                                color:
                                    isDark ? TColors.textWhite : TColors.dark,
                              ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(
                        width: TSizes.xs,
                      ),
                      userRecord.verifiedAccount
                          ? const Icon(
                              Iconsax.verify5,
                              color: TColors.primary,
                              size: 19,
                            )
                          : const Icon(
                              Iconsax.verify,
                              color: TColors.primary,
                              size: 19,
                            ),
                      if (userRecord.politicalStatus.index == 0)
                        const PLStatus(statusText: 'CL'),
                      if (userRecord.politicalStatus.index == 1)
                        const PLStatus(statusText: 'FL'),
                      if (userRecord.politicalStatus.index == 2)
                        const PLStatus(statusText: 'AL'),
                      if (userRecord.politicalStatus.index == 3)
                        const PLStatus(statusText: 'CC'),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${THelperFunctions.humanizeNumber(userRecord.followers.length)} followers',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 13,
                                ),
                      ),
                      const SizedBox(
                        width: TSizes.sm,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: TSizes.sm,
                        ),
                        child: AppDecorationDot(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      const SizedBox(
                        width: TSizes.sm,
                      ),
                      Text(
                        '${THelperFunctions.humanizeNumber(userRecord.following.length)} following',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontSize: 13,
                                ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PLStatus extends StatelessWidget {
  const PLStatus({
    super.key,
    required this.statusText,
  });

  final String statusText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: TSizes.xs,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Iconsax.shield,
            color: TColors.primary,
            size: 18,
          ),
          Text(
            statusText,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: TColors.primary,
                  fontSize: 6,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
