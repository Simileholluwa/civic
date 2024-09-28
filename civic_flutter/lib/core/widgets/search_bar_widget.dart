import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
    required this.onChanged,
    this.height = 50,
  });

  final void Function(String) onChanged;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      constraints: BoxConstraints(
        maxHeight: height,
        minHeight: height,
      ),
      onChanged: onChanged,
      elevation: const WidgetStatePropertyAll(
        0,
      ),
      backgroundColor: WidgetStatePropertyAll(
        THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
      ),
      hintText: 'Search for places',
      leading: const Icon(
        Iconsax.search_normal,
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
          horizontal: TSizes.md,
        ),
      ),
    );
  }
}
