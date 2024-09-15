import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app_text_field.dart';
import 'package:civic_flutter/core/widgets/dual_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

Future<bool?> schedulePostSheet({
  required BuildContext context,
  required String title,
  required String description,
  required VoidCallback? onTapActiveButton,
  required TextEditingController textController,
  required VoidCallback onTextFieldTapped,
}) {
  return showModalBottomSheet<bool>(
      barrierColor: Theme.of(context).scaffoldBackgroundColor.withAlpha(
            50,
          ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      context: context,
      builder: (context) {
        return SizedBox(
          height: 360,
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(
              horizontal: TSizes.md,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(
                  TSizes.lg,
                ),
                topLeft: Radius.circular(
                  TSizes.lg,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: TSizes.sm + 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
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
                  height: TSizes.sm,
                ),
                const Divider(),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: TSizes.sm,
                      ),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      AppTextField(
                        textController: textController,
                        prefixIcon: Iconsax.calendar5,
                        hintText: 'Select date and time',
                        validator: TValidator.validateEmail,
                        readOnly: true,
                        onTap: onTextFieldTapped,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      DualButton(
                        onTapActiveButton: onTapActiveButton,
                        activeButtonText: 'View all schedule',
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
        );
      });
}
