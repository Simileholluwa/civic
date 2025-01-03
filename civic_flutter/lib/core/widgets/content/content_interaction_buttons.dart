import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ContentInteractionButton extends StatelessWidget {
  const ContentInteractionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.color,
    this.showTitle = true,
  });

  final IconData icon;
  final bool showTitle;
  final String title;
  final VoidCallback onTap;
  final Color color;

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
                  size: 20,
                  color: color,
                ),
                if (showTitle)
                  const SizedBox(
                    width: 5,
                  ),
                if (showTitle)
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 14,
                          color: color,
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
