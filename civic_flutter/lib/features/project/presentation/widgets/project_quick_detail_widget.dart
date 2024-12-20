import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ProjectQuickDetailWidget extends StatelessWidget {
  const ProjectQuickDetailWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  final Color color;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
        color: isDark ? TColors.dark : TColors.light,
        borderRadius: BorderRadius.circular(
          100,
        ),
        border: Border(
          right: BorderSide(
            color: color,
            width: .3,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: color.withOpacity(
                0.1,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 10),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
