import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/decorating_dot.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
    this.fullName,
    required this.userName,
    required this.followers,
    required this.following,
    required this.imageUrl,
    required this.onTap,
    required this.isVerified,
  });

  final String? fullName;
  final String userName;
  final int followers;
  final int following;
  final String imageUrl;
  final VoidCallback onTap;
  final bool isVerified;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: TSizes.md,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: TColors.primary,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                      errorWidget: (context, url, child) {
                        return const Center(
                          child: Icon(
                            CupertinoIcons.person_alt_circle_fill,
                            size: 47,
                            color: TColors.textWhite,
                          ),
                        );
                      },
                      progressIndicatorBuilder: (context, url, progress) {
                        return const Center(
                          child: Icon(
                            CupertinoIcons.person_alt_circle_fill,
                            size: 47,
                            color: TColors.textWhite,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                isVerified
                    ? const Icon(
                        Icons.verified_user_sharp,
                        color: TColors.primary,
                      )
                    : const SizedBox.shrink(),
              ],
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
                  Text(
                    fullName ?? userName,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 20,
                          color: isDark ? TColors.textWhite : TColors.dark,
                        ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${THelperFunctions.humanizeNumber(followers)} followers',
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
                        child: DecoratingDot(
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      const SizedBox(
                        width: TSizes.sm,
                      ),
                      Text(
                        '${THelperFunctions.humanizeNumber(following)} following',
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
