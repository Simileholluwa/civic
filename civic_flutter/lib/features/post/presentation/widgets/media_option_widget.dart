import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/media_provider.dart';
import 'package:flutter/material.dart';

class MediaOptionWidget extends StatelessWidget {
  const MediaOptionWidget({
    super.key,
    required this.controller,
    required this.mediaOptionsList,
    required this.mediaTile,
  });

  final Media controller;
  final Widget mediaOptionsList;
  final String mediaTile;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mediaTile,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
        ),
        const SizedBox(
          height: TSizes.sm,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.md,
          ),
          decoration: BoxDecoration(
            color: isDark ? TColors.dark : TColors.light,
            borderRadius: BorderRadius.circular(
              TSizes.sm,
            ),
          ),
          child: mediaOptionsList,
        ),
      ],
    );
  }
}
