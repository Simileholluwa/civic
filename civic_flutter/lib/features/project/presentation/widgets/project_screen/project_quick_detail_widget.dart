import 'package:flutter/material.dart';

class ProjectQuickDetailWidget extends StatelessWidget {
  const ProjectQuickDetailWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
    this.size = 30,
    this.iconSize = 15,
    required this.textStyle,
  });

  final Color color;
  final IconData icon;
  final String title;
  final double size;
  final double iconSize;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(
          100,
        ),
        border: Border(
          right: BorderSide(
            color: color,
            width: .3,
          ),
          left: BorderSide(
            color: color,
            width: .3,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 
                0.1,
              ),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: color,
              size: iconSize,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 10),
            child: Text(
              title,
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
