import 'package:flutter/material.dart';

class CustomBottomNavigationBarItem {
  CustomBottomNavigationBarItem({
    required this.activeIcon,
    required this.inactiveIcon,
    this.text,
    this.iconSize = 30,
    this.activeIconSize = 32,
  });
  final IconData activeIcon;
  final IconData inactiveIcon;
  final double iconSize;
  final double activeIconSize;
  final String? text;
}