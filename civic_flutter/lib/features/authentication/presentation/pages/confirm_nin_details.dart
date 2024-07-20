import 'package:cached_network_image/cached_network_image.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/choose_verification_method.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/user_nin_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ConfirmNinDetails extends GetView<AuthController> {
  const ConfirmNinDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final userNinEntity = controller.state.userNinEntity?.value;
    final isDark = THelperFunctions.isDarkMode(context);
    return AndroidBottomNav(
      child: Scaffold(
        appBar: const AuthAppBar(
          icon: Iconsax.arrow_left_2,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              const AuthHeader(
                authTitle: 'Confirm your details',
                authSubTitle: 'Kindly ensure your details are correct '
                    'before proceeding.',
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections * 2 + 20,
              ),
              Stack(
                alignment: Alignment.topLeft,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace,
                      vertical: TSizes.md,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        TSizes.borderRadiusLg + 20,
                      ),
                      color: isDark ? TColors.dark : TColors.light,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 140,
                          ),
                          child: Container(
                            height: TSizes.spaceBtwSections * 2 - 6,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  UserNinDetails(
                                    value: 'GENDER',
                                    detail: userNinEntity!.gender!,
                                  ),
                                  const SizedBox(
                                    height: 40,
                                    child: VerticalDivider(
                                      width: 5,
                                      endIndent: 13,
                                    ),
                                  ),
                                  UserNinDetails(
                                    value: 'BIRTHDATE',
                                    detail: userNinEntity.birthdate!,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems - 10,
                        ),
                        UserNinDetails(
                          value: 'NAME',
                          detail:
                              '${userNinEntity.firstName!} ${userNinEntity.surname}',
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        UserNinDetails(
                          value: 'EMAIL',
                          detail: controller.redactEmail(
                            userNinEntity.email!,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        UserNinDetails(
                          value: 'PHONE NUMBER',
                          detail: controller.redactString(
                            userNinEntity.telephone!,
                            3,
                            start: 6,
                          ),
                        ),
                        const SizedBox(
                          height: TSizes.sm,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -60,
                    left: TSizes.defaultSpace,
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 5,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: userNinEntity.photoUrl!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                height: 70,
                child: FilledButton(
                  onPressed: () => chooseVerificationMethod(
                    context,
                    userNinEntity,
                  ),
                  child: const Center(
                    child: Text(
                      TTexts.tContinue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
