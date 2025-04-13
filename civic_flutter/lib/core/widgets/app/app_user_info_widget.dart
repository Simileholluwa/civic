import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

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
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),                    
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        '${THelperFunctions.humanizeNumber(userRecord.followers!.length)} followers',
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
                        '${THelperFunctions.humanizeNumber(userRecord.following!.length)} following',
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
