import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app_text_field.dart';
import 'package:civic_flutter/core/widgets/dual_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

Future<bool?> schedulePostDialog({
  required BuildContext context,
  required String title,
  required String description,
  required VoidCallback? onTapActiveButton,
  required TextEditingController textController,
  required VoidCallback onTextFieldTapped,
}) {
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              TSizes.sm,
            ),
          ),
          elevation: 8,
          content: SizedBox(
            height: 361,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Schedule post',
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
