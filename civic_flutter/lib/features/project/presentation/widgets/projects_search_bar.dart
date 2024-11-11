import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class CivicSearchBar extends StatelessWidget {
  const CivicSearchBar({
    super.key,
    required this.leftWidget,
    required this.rightWidget,
    required this.searchText,
    required this.placeBeforeSearch,
    required this.placeAfterSearch,
  });

  final Widget leftWidget;
  final Widget rightWidget;
  final String searchText;
  final bool placeBeforeSearch;
  final bool placeAfterSearch;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          placeBeforeSearch == true ? leftWidget : const SizedBox(),
          Container(
            width: THelperFunctions.getWidth(context) - 107,
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
                  placeBeforeSearch == false ? leftWidget : const SizedBox(),
                  Text(
                    searchText,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: Theme.of(context).hintColor,
                        ),
                  ),
                  placeAfterSearch == false ? rightWidget : const SizedBox(),
                ],
              ),
            ),
          ),
          placeAfterSearch == true ? rightWidget : const SizedBox(),
        ],
      ),
    );
  }
}
