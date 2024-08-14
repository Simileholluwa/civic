import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final TabController controller;
  final int index;
  final String text;

  const CustomTab({
    super.key,
    required this.controller,
    required this.index,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = controller.index == index;
    final isDark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        controller.animateTo(index);
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? isDark
                  ? TColors.textWhite
                  : TColors.dark
              : isDark
                  ? TColors.dark
                  : TColors.light,
          borderRadius: BorderRadius.circular(
            TSizes.borderRadiusLg,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
