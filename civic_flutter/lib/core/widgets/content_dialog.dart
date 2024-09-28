import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/dual_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool?> postDialog({
  required BuildContext context,
  required String title,
  required String description,
  required VoidCallback onTapSkipButton,
  required String activeButtonText,
  required bool activeButtonLoading,
  required bool skipButtonLoading,
  required VoidCallback onTapActiveButton,
  required String skipText,
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
            height: 283,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
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
                    children: [
                      const SizedBox(
                        height: TSizes.md,
                      ),
                      Text(
                        description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),
                      DualButton(
                        onTapActiveButton: onTapActiveButton,
                        activeButtonText: activeButtonText,
                        activeButtonLoading: activeButtonLoading,
                        onTapSkipButton: onTapSkipButton,
                        skipButtonLoading: skipButtonLoading,
                        skipText: skipText,
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
