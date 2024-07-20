import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/filled_icon_button.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProjectsSearchBar extends StatelessWidget {
  const ProjectsSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Container(
        width: double.maxFinite,
        height: 55,
        decoration: BoxDecoration(
          color: isDark ? TColors.darkContainer : TColors.light,
          borderRadius: BorderRadius.circular(
            200,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.sm,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledIconButton(
                isDark: isDark,
                icon: Iconsax.filter,
                onPressed: () {},
              ),
              Text(
                'Search in projects',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
              FilledIconButton(
                isDark: isDark,
                icon: Iconsax.microphone,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
