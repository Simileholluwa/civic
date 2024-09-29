import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MediaOptions extends StatelessWidget {
  const MediaOptions({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(
        Iconsax.arrow_right_2,
        size: 20,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.w500,
              color: THelperFunctions.isDarkMode(context)
                  ? TColors.textWhite
                  : TColors.dark,
            ),
      ),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }
}
