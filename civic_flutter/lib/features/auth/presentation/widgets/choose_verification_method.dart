import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<Widget?> chooseVerificationMethod(
  BuildContext context,
) {
  //final controller = AuthController.instance;
  return showModalBottomSheet<Widget>(
    context: context,
    enableDrag: false,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.transparent,
    builder: (context) {
      return Container(
        margin: const EdgeInsets.all(
          TSizes.md,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(
            TSizes.borderRadiusLg + 20,
          ),
          border: Border.all(
            color: Theme.of(context).hintColor.withValues(alpha: .2),
            width: 0.5,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: TSizes.defaultSpace,
                right: TSizes.sm,
                top: TSizes.sm,
                bottom: TSizes.xs,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Select verification method',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  IconButton(
                    onPressed: context.pop,
                    icon: const Icon(
                      Icons.clear,
                      color: TColors.secondary,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SelectVerificationMethod(
              value: 1,
              title: 'Phone verification',
              subTitle: 'An SMS containing your OTP will be '
                  'sent to ${THelperFunctions.redactString(
                '',
                3,
                start: 6,
              )} to verify your identity.',
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            SelectVerificationMethod(
              value: 2,
              title: 'Email verification',
              subTitle: 'An email containing your OTP will be '
                  'sent to ${THelperFunctions.redactEmail(
                '',
              )} to verify your identity.',
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
              ),
              child: FilledButton(
                onPressed: () {},
                child: const Text(
                  'Send OTP',
                ),
              ).withLoading(
                loading: false,
              ),
            ),
            const SizedBox(
              height: TSizes.sm,
            ),
          ],
        ),
      );
    },
  );
}
