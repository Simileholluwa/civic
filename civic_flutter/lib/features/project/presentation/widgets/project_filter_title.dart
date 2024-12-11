
import 'package:civic_client/civic_client.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProjectFilterTitle extends StatelessWidget {
  const ProjectFilterTitle({
    super.key,
    required this.filter,
    required this.onTap,
  });

  final String filter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(filter),
      titleTextStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
      trailing: const Icon(
        Iconsax.arrow_down_2,
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      onTap: onTap,
    );
  }
}
