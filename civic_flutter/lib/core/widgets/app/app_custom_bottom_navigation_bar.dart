import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class AppCustomBottomNavigationBar extends StatelessWidget {
  const AppCustomBottomNavigationBar({
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
            context,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildNavItem(
    CustomBottomNavigationBarItem item,
    int index,
    BuildContext context,
  ) {
    final isSelected = currentIndex == index;
    final isDark = THelperFunctions.isDarkMode(context);
    return IconButton(
      onPressed: () => onItemTapped(index),
      icon: Icon(
        isSelected ? item.activeIcon : item.inactiveIcon,
        color: isSelected
            ? isDark
                ? TColors.textWhite
                : TColors.dark
            : Theme.of(context).disabledColor,
        size: isSelected ? item.activeIconSize : item.iconSize,
      ),
    );
  }
}
