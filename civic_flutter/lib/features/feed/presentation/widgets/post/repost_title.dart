import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class RepostTitle extends StatelessWidget {
  const RepostTitle({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProjectQuickDetailWidget(
            icon: Iconsax.repeate_music5,
            title: text,
            color: Colors.yellow.shade900,
            textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).hintColor,
                ),
          ),
        ],
      ),
    );
  }
}
