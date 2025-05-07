import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ProjectPdfThumbnailError extends ConsumerWidget {
  const ProjectPdfThumbnailError({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500,
        maxHeight: 500,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.not_accessible,
            size: 60,
            color: Colors.grey[600],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "We couldn't load your pdf.",
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextButton.icon(
            onPressed: () => ref.invalidate(projectPdfThumbnailProvider),
            label: const Text('Reload'),
            icon: const Icon(
              Icons.refresh_sharp,
            ),
          )
        ],
      ),
    );
  }
}
