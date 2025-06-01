import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';

class MoreActionsListTile extends StatelessWidget {
  const MoreActionsListTile({
    super.key,
    this.color,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.onTap,
  });

  final Color? color;
  final String title;
  final String subTitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: color ?? Theme.of(context).colorScheme.primary,
        size: 24,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 18,
              color: color,
            ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontSize: 14,
              color: color,
            ),
      ),
      onTap: onTap,
    );
  }
}
