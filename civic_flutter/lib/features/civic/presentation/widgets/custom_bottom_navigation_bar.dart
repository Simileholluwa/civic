import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/features/civic/domain/entity/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onItemTapped,
    required this.items,
    required this.backgroundColor,
    this.isPost = false,
    super.key,
  });
  final int currentIndex;
  final void Function(int) onItemTapped;
  final List<CustomBottomNavigationBarItem> items;
  final Color backgroundColor;
  final bool isPost;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: TSizes.md,
        right: TSizes.md,
        top: TSizes.sm,
        bottom: TSizes.xs,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.asMap().entries.map((entry) {
          final idx = entry.key;
          final item = entry.value;
          return _buildNavItem(
            item,
            idx,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNavItem(
    CustomBottomNavigationBarItem item,
    int index,
  ) {
    final isSelected = currentIndex == index;
    final isDark = THelperFunctions.isDarkMode(Get.context!);
    return IconButton(
      onPressed: () => onItemTapped(index),
      icon: Icon(
        isSelected ? item.activeIcon : item.inactiveIcon,
        color: isSelected
            ? isDark
                ? TColors.textWhite
                : TColors.dark
            : isDark
                ? TColors.darkerGrey
                : TColors.darkGrey,
        size: isSelected ? item.activeIconSize : item.iconSize,
      ),
    );
  }
}

