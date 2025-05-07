import 'package:flutter/material.dart';

class ProjectFilterColumnDivider extends StatelessWidget {
  const ProjectFilterColumnDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Theme.of(context).dividerColor,
            thickness: 1,
            height: 0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'OR',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        Expanded(
          child: Divider(
            color: Theme.of(context).dividerColor,
            thickness: 1,
            height: 0,
          ),
        ),
      ],
    );
  }
}
