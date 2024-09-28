import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/dual_button.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

Future<bool?> requestLocationPremissionDialog({
  required BuildContext context,
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
                      'Location permission',
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
                        'To add locations to your post, CIVIC requires permission access to your device location.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      DualButton(
                        onTapActiveButton: () async {
                          context.pop();
                          await Geolocator.requestPermission();   
                        },
                        activeButtonText: 'Grant access',
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
