import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/select_verification_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<Widget?> chooseVerificationMethod(
  BuildContext context,
  UserNinRecord userNinEntity,
) {
  final controller = AuthController.instance;
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
            color: Theme.of(Get.context!).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(
              TSizes.borderRadiusLg + 20,
            ),
            border: Border.all(
              color: Theme.of(Get.context!).hintColor.withOpacity(.2),
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
                        Get.back<dynamic>();
                        controller.state.isLoadingSendNinCode.value = false;
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
                    'sent to ${controller.redactString(
                  userNinEntity.telephone!,
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
                    'sent to ${controller.redactEmail(
                  userNinEntity.email!,
                )} to verify your identity.',
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace,
                ),
                child: Obx(
                  () => FilledButton(
                    onPressed: () {},
                    child: const Text(
                      'Send OTP',
                    ),
                  ).withLoading(
                    loading:
                        controller.state.selectionVerificationMethod.value == 1
                            ? controller.state.isLoadingSendNinCode.value
                            : controller.state.isLoadingVerifyEmail.value,
                  ),
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
