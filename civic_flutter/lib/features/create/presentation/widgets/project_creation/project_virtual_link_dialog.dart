import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

Future<bool?> virtualLinkDialog({
  required BuildContext context,
  required Project project,
  int? index,
  String? link,
}) {
  final formKey = GlobalKey<FormState>();
  var initialized = false;

  return showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      return Consumer(
        builder: (context, ref, _) {
          final projectNotifier = ref.read(
            createProjectNotifProvider(project).notifier,
          );

          if (!initialized && index != null && link != null) {
            projectNotifier.virtualLocationController.text = link;
            initialized = true;
          }

          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(TSizes.sm),
            ),
            elevation: 8,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Virtual location',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        projectNotifier.virtualLocationController.clear();
                        dialogContext.pop();
                      },
                      child: const Icon(
                        Icons.clear,
                        color: TColors.secondary,
                      ),
                    ),
                  ],
                ),
                const Divider(height: 0),
                Text(
                  'Enter a link that will direct users to the virtual location of your project.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 1),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      AppTextField(
                        textController:
                            projectNotifier.virtualLocationController,
                        prefixIcon: Iconsax.link,
                        textCapitalization: TextCapitalization.none,
                        hintText: 'E.g. https://nelf.gov.ng',
                        maxLines: 1,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(
                              color:
                                  Theme.of(context).textTheme.bodySmall!.color,
                            ),
                        validator: TValidator.validateProjectLink,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      AppDualButton(
                        onTapActiveButton: () {
                          final isValid = formKey.currentState!.validate();
                          if (!isValid) return;
                          if (index != null) {
                            projectNotifier.editVirtualLocation(
                              projectNotifier.virtualLocationController.text,
                              index,
                            );
                            projectNotifier.virtualLocationController.clear();
                            dialogContext.pop();
                          } else {
                            projectNotifier.addVirtualLocations(
                              projectNotifier.virtualLocationController.text,
                            );
                            projectNotifier.virtualLocationController.clear();
                            dialogContext.pop();
                          }
                        },
                        activeButtonText: 'Submit',
                        activeButtonLoading: false,
                        onTapSkipButton: () {
                          projectNotifier.virtualLocationController.clear();
                          dialogContext.pop();
                        },
                        skipButtonLoading: false,
                        skipText: 'Cancel',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
