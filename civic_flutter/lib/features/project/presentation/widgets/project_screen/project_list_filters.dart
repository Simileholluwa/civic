

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ProjectListFilters extends StatelessWidget {
  const ProjectListFilters({
    required this.showModal, required this.filterText, required this.filterTextPlaceholder, required this.child, required this.onFilterTap, super.key,
  });

  final Widget child;
  final String filterText;
  final String filterTextPlaceholder;
  final VoidCallback onFilterTap;
  final bool showModal;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onFilterTap,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          bottom: 10,
        ),
        child: Row(
          children: [
            Text(
              filterText.isEmpty
                  ? filterTextPlaceholder.toUpperCase()
                  : filterText.toUpperCase(),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: filterText.isEmpty
                        ? isDark
                            ? TColors.darkerGrey
                            : TColors.darkGrey
                        : Theme.of(context).textTheme.labelLarge!.color,
                  ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: TColors.primary,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
