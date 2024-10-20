import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/app/app_button.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/select_verification_method.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<Widget?> chooseVerificationMethod(
  BuildContext context,
  UserNinRecord userNinRecord,
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
              color: Theme.of(context).hintColor.withOpacity(.2),
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
                      onPressed: () {
                        context.pop;
                      },
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
                  userNinRecord.telephone!,
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
                  userNinRecord.email!,
                )} to verify your identity.',
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace,
                ),
                child:FilledButton(
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
      });
}
