import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class ProjectPDFAttachmentsTabView extends ConsumerWidget {
  const ProjectPDFAttachmentsTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
    final pdfs = [];
    // int current = ref.watch(pageChangedProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          if (pdfs.isEmpty)
            Container(
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
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            Iconsax.folder5,
                            size: 60,
                            color: Colors.grey[600],
                          ),
                          onPressed: () async {},
                        ),
                      ],
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
            ),
          if (pdfs.isNotEmpty) Text(pdfs.first.toString())
        ],
      ),
    );
  }
}
