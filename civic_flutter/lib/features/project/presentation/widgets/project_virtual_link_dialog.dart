import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app/app_dual_button.dart';
import 'package:civic_flutter/core/widgets/app/app_text_field.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/project/presentation/providers/project_provider.dart';
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
  return showDialog<bool>(
      context: context,
      builder: (context) {
        final formKey = GlobalKey<FormState>();
        return Consumer(builder: (context, ref, _) {
          final projectState = ref.watch(projectProviderProvider(project));
          final projectNotifier =
              ref.watch(projectProviderProvider(project).notifier);
          if (index != null && link != null) {
            projectState.virtualLocationController.text = link;
          }
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                TSizes.sm,
              ),
            ),
            elevation: 8,
            content: Container(
              constraints: const BoxConstraints(
                maxHeight: 386,
                minHeight: 361,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        onTap: context.pop,
                        child: const Icon(
                          Icons.clear,
                          color: TColors.secondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.md,
                  ),
                  const Divider(
                    height: 0,
                  ),
                  SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      vertical: TSizes.sm + 4,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: TSizes.md,
                        ),
                        Text(
                          'Enter a link that will direct users to the virtual location of your project.',
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.start,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Column(
                            children: [
                              AppTextField(
                                textController:
                                    projectState.virtualLocationController,
                                prefixIcon: Iconsax.link,
                                hintText: 'E.g. https://nelf.gov.ng',
                                maxLines: 1,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .color!,
                                    ),
                                validator: (value) =>
                                    TValidator.validateProjectLink(value),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwSections,
                              ),
                              AppDualButton(
                                onTapActiveButton: () {
                                  final isValid =
                                      formKey.currentState!.validate();
                                  if (!isValid) return;
                                  if (index != null) {
                                    projectNotifier.editVirtualLocation(
                                      projectState.virtualLocationController.text,
                                      index,
                                    );
                                    projectState.virtualLocationController
                                        .clear();
                                    context.pop();
                                  } else {
                                    projectNotifier.addVirtualLocations(
                                      projectState.virtualLocationController.text,
                                    );
                                    projectState.virtualLocationController
                                        .clear();
                                    context.pop();
                                  }
                                },
                                activeButtonText: 'Submit',
                                activeButtonLoading: false,
                                onTapSkipButton: context.pop,
                                skipButtonLoading: false,
                                skipText: 'Cancel',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      });
}
