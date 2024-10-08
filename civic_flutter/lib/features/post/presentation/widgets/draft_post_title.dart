import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class DraftPostTitle extends StatelessWidget {
  const DraftPostTitle({
    super.key,
    required this.post,
    required this.index,
  });

  final DraftPost post;
  final int index;

  @override
  Widget build(BuildContext context) {
    final age = DateTime.now()
        .difference(
          DateTime.fromMillisecondsSinceEpoch(
            int.parse(
              post.createdAt!.millisecondsSinceEpoch.toString(),
            ),
          ),
        )
        .inDays;
    return Padding(
      padding: const EdgeInsets.only(
        left: TSizes.md,
        right: TSizes.sm,
        top: TSizes.md,
        bottom: TSizes.sm,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Draft ${index + 1}',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: THelperFunctions.isDarkMode(context) ? TColors.textWhite : TColors.dark,
                ),
          ),
          Text(
            'Expires in ${10 - age} ${age == 10 ? 'today' : age == 9 ? 'day' : 'days'}',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 13,
                ),
          ),
        ],
      ),
    );
  }
}
