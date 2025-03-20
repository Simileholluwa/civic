import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ContentInteractionButton extends StatelessWidget {
  const ContentInteractionButton({
    super.key,
    required this.icon,
    required this.onTap,
    required this.color,
    this.showText = true,
    this.text = '',
    this.iconSize = 24,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color color;
  final String text;
  final bool showText;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                TSizes.sm,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: color,
                  size: iconSize,
                ),
                if (showText)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      ' $text',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: color,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
