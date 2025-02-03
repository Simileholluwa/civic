import 'package:flutter/material.dart';

class AppFilledIconButton extends StatelessWidget {
  const AppFilledIconButton({
    this.color,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
    this.size = 42,
    super.key,
  });

  final Color? color;
  final IconData icon;
  final VoidCallback onPressed;
  final double size;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: ButtonStyle(
        maximumSize: WidgetStatePropertyAll(
          Size(
            size,
            size,
          ),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(
            size,
            size,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(
          backgroundColor,
        ),
      ),
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
