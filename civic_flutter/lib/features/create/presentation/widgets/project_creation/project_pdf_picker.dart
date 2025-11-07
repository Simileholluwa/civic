import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectPdfPicker extends ConsumerWidget {
  const ProjectPdfPicker({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectNotifier = ref.read(
      createProjectNotifProvider(
        project,
      ).notifier,
    );
    return Container(
      width: double.maxFinite,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Iconsax.folder5,
                size: 60,
                color: Colors.grey[600],
              ),
              onPressed: projectNotifier.pickPDFs,
            ),
            Center(
              child: Text(
                'Select up to 5 PDFs from your device.',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
