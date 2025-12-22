import 'package:flutter/material.dart';

class ProjectVetButton extends StatelessWidget {
  const ProjectVetButton({
    required this.title,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
    this.isApprove = false,
    this.isDisapprove = false,
    this.iconSize = 15,
    this.fontSize = 16,
    super.key,
  });

  final String title;
  final IconData icon;
  final Color backgroundColor;
  final Color textColor;
  final bool isApprove;
  final bool isDisapprove;
  final VoidCallback? onTap;
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: isApprove ? const Radius.circular(100) : Radius.zero,
            bottomLeft: isApprove ? const Radius.circular(100) : Radius.zero,
            topRight: isDisapprove ? const Radius.circular(100) : Radius.zero,
            bottomRight:
                isDisapprove ? const Radius.circular(100) : Radius.zero,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: iconSize,
              color: textColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
