import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class ProjectPdfThumbnailLoader extends StatelessWidget {
  const ProjectPdfThumbnailLoader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500,
        maxHeight: 500,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
