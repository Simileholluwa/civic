import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

Future<bool?> manualLocationDialog({
  required BuildContext context,
  required Project project,
  int? index,
  String? location,
}) {
  final formKey = GlobalKey<FormState>();
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return Consumer(
        builder: (context, ref, _) {
          final projectCreationSate = ref.watch(projectProviderProvider(project));
          final projectNotifier =
              ref.watch(projectProviderProvider(project).notifier);
          if (index != null) {
            projectCreationSate.manualLocationController.text = location!;
          }
          return LayoutBuilder(builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: constraints.maxHeight * 0.9,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        TSizes.sm,
                      ),
                    ),
                    elevation: 8,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Manual location',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
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
                          padding: const EdgeInsets.only(
                            top: TSizes.sm + 4,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: TSizes.sm,
                              ),
                              Text(
                                'Enter the street number, street name, city, state, and country of the location.',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.start,
                              ),
                              const SizedBox(
                                height: TSizes.spaceBtwItems,
                              ),
                              Form(
                                key: formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  children: [
                                    AppTextField(
                                      textController:
                                          projectCreationSate.manualLocationController,
                                      prefixIcon: Iconsax.location_tick5,
                                      hintText:
                                          'E.g. 123 Main St, Ikeja, Lagos, Nigeria',
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
                                          TValidator.validateEmptyText(
                                              'Location', value),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const SizedBox(
                                      height: TSizes.spaceBtwSections,
                                    ),
                                    AppDualButton(
                                      onTapActiveButton: () {
                                        final isValid =
                                            formKey.currentState!.validate();
                                        if (!isValid) {
                                          return;
                                        }
                                        if (index != null) {
                                          projectNotifier.editManualLocation(
                                            projectCreationSate
                                                .manualLocationController.text,
                                            index,
                                          );
                                          projectCreationSate.manualLocationController
                                              .clear();
                                          context.pop();
                                        } else {
                                          projectNotifier.addManualLocation(
                                            projectCreationSate
                                                .manualLocationController.text,
                                          );
                                          projectCreationSate.manualLocationController
                                              .clear();
                                          context.pop();
                                        }
                                      },
                                      activeButtonText: 'Submit',
                                      activeButtonLoading: false,
                                      onTapSkipButton: () {
                                        projectCreationSate.manualLocationController
                                            .clear();
                                        context.pop();
                                      },
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
                ],
              ),
            );
          });
        },
      );
    },
  );
}
