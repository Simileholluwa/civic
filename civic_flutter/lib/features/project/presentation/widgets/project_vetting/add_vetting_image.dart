import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class AddVettingImage extends ConsumerWidget {
  const AddVettingImage({
    required this.projectVetting, super.key,
  });

  final ProjectVetting? projectVetting;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vettedProjectNotifier = ref.watch(
      projectVetProvider(
        projectVetting,
      ).notifier,
    );
    return Container(
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Iconsax.gallery5,
                  size: 60,
                  color: Colors.grey[600],
                ),
                onPressed: () async {
                  await vettedProjectNotifier.pickImageProof();
                },
              ),
              IconButton(
                icon: Icon(
                  Iconsax.camera5,
                  size: 60,
                  color: Colors.grey[600],
                ),
                onPressed: () async {
                  await vettedProjectNotifier.captureImageProof();
                },
              ),
            ],
          ),
          Text(
            'Choose from your gallery or capture one',
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
