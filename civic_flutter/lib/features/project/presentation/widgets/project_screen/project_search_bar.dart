import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProjectSearchBar extends StatelessWidget {
  const ProjectSearchBar({
    required this.onChanged,
    super.key,
    this.height = 50,
    this.hintText = 'Search for projects',
  });

  final void Function(String) onChanged;
  final double height;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: SearchBar(
            constraints: BoxConstraints(
              maxHeight: height,
              minHeight: height,
            ),
            onChanged: onChanged,
            elevation: const WidgetStatePropertyAll(
              0,
            ),
            backgroundColor: WidgetStatePropertyAll(
              THelperFunctions.isDarkMode(context)
                  ? TColors.dark
                  : TColors.light,
            ),
            hintText: hintText,
            leading: Padding(
              padding: const EdgeInsets.only(
                right: 8,
              ),
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: const Icon(
                  Iconsax.search_normal,
                ),
              ),
            ),
            hintStyle: WidgetStatePropertyAll(
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
            ),
            textStyle: WidgetStatePropertyAll(
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(
                horizontal: TSizes.xs,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
