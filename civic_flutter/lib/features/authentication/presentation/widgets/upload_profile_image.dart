import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/dual_button.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

Future<Widget?> uploadProfileImage(
  BuildContext context,
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
                  top: TSizes.md,
                  bottom: TSizes.sm,
                ),
                child: Text(
                  'Upload profile image',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Divider(
                indent: TSizes.md + 4,
                endIndent: TSizes.md + 4,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              GetBuilder<AuthController>(
                id: 15,
                builder: (controller) {
                  return Column(
                    children: [
                      Container(
                        height: 180,
                        width: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: THelperFunctions.isDarkMode(context)
                              ? TColors.dark
                              : TColors.light,
                        ),
                        child: controller.state.profileImage.isEmpty
                            ? const CircleAvatar(
                                radius: 90,
                                child: Icon(
                                  CupertinoIcons.person_alt_circle,
                                  size: 180,
                                ),
                              )
                            : CircleAvatar(
                                radius: 90,
                                backgroundImage: FileImage(
                                  controller.state.profileImage[0],
                                ),
                              ),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Select an image that clearly shows your face. '
                          'An headshot preferably.',
                          style: Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: TSizes.xs,),
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: THelperFunctions.isDarkMode(context)
                              ? TColors.dark
                              : TColors.light,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: controller.state.profileImage.isNotEmpty,
                              child: IconButton(
                                onPressed: controller.cropImage,
                                icon: const Icon(
                                  Iconsax.edit,
                                  size: 27,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: controller.state.profileImage.isNotEmpty,
                              child: const SizedBox(
                                width: TSizes.xs,
                              ),
                            ),
                            Visibility(
                              visible: controller.state.profileImage.isEmpty,
                              child: IconButton(
                                onPressed: controller.selectImage,
                                icon: const Icon(
                                  Iconsax.gallery5,
                                  size: 27,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: controller.state.profileImage.isEmpty,
                              child: const SizedBox(
                                width: TSizes.xs,
                              ),
                            ),
                            Visibility(
                              visible: controller.state.profileImage.isEmpty,
                              child: IconButton(
                                onPressed: controller.takeImage,
                                icon: const Icon(
                                  Iconsax.camera5,
                                  size: 27,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: controller.state.profileImage.isNotEmpty,
                              child: IconButton(
                                onPressed: controller.removeImage,
                                icon: const Icon(
                                  Iconsax.trash,
                                  size: 27,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: TSizes.md,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.defaultSpace,
                ),
                child: DualButton(
                  onTapSkipButton: () {
                    // controller.sendEmailVerificationCode(shouldNavigate: true);
                    Get.back();
                  },
                  activeButtonText: 'Upload',
                  onTapActiveButton: controller.uploadProfileImageToFirebase,
                  activeButtonLoading: controller.state.isLoadingUploadImage,
                  skipButtonLoading: controller.state.isLoadingVerifyEmail,
                ),
              ),
            ],
          ),
        );
      },
  );
}