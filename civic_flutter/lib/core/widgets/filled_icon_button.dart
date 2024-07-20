import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FilledIconButton extends StatelessWidget {
  const FilledIconButton({
    required this.isDark,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final bool isDark;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: ButtonStyle(
        maximumSize: const WidgetStatePropertyAll(
          Size(
            42,
            42,
          ),
        ),
        fixedSize: const WidgetStatePropertyAll(
          Size(
            42,
            42,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          isDark ? TColors.dark : TColors.textWhite,
        ),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: isDark ? TColors.textWhite : TColors.dark,
      ),
    );
  }
}
