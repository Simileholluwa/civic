import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class DeletedProjectPlaceholder extends ConsumerWidget {
  const DeletedProjectPlaceholder({
    required this.project,
    super.key,
    this.showInteractions = false,
  });

  final Project project;
  final bool showInteractions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.read(localStorageProvider).getInt('userId');
    final isOwner = userId == project.ownerId;
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      height: 300,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          TSizes.md,
        ),
        color: Theme.of(context).cardColor,
        border: Border.all(
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            Icon(
              Iconsax.trash,
              size: 70,
              color: Theme.of(context).disabledColor,
            ),
            Text(
              'This project has been removed by the author, preventing further interaction. '
              'However, you can still view and engage with existing reviews and vettings.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).disabledColor,
                  ),
              textAlign: TextAlign.center,
            ),
            if (isOwner && showInteractions)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ContentDoubleButton(
                  firstButtonOnPressed: () {},
                  firstButtonIcon: Iconsax.refresh,
                  firstButtonText: 'Restore',
                  secondButtonOnPressed: () {},
                  secondButtonColor: Colors.red,
                  secondButtonIcon: Iconsax.trash,
                  secondButtonText: 'Delete forever',
                ),
              ),
          ],
        ),
      ),
    );
  }
}
