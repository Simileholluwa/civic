import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/cai_widget.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/image_strings.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLandingScreen extends GetView<AuthController> {
  const AuthLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return AndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                TImageTexts.appLogo,
                height: 100,
              ),
              const SizedBox(height: TSizes.md,),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.md,
                  vertical: TSizes.md - 2,
                ),
                decoration: BoxDecoration(
                  color: isDark ? TColors.dark : TColors.light,
                  borderRadius: BorderRadius.circular(
                    TSizes.borderRadiusLg + 10,
                  ),
                  border: const Border(
                    left: BorderSide(color: TColors.secondary),
                    right: BorderSide(color: TColors.secondary),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      'Developing political leaders who are...',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const Divider(
                      indent: 35,
                      endIndent: 35,
                      color: TColors.secondary,
                      thickness: .5,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CaiWidget(
                          letter: 'C',
                          meaning: 'credible',
                        ),
                        SizedBox(
                          height: 80,
                          child: VerticalDivider(
                            width: 5,
                            indent: 20,
                          ),
                        ),
                        CaiWidget(
                          letter: 'A',
                          meaning: 'accountable',
                        ),
                        SizedBox(
                          height: 80,
                          child: VerticalDivider(
                            width: 5,
                            indent: 20,
                          ),
                        ),
                        CaiWidget(
                          letter: 'I',
                          meaning: 'identifiable',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections - 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: FilledButton(
                  onPressed: controller.checkEmailIfNewUser,
                  child: const Text(
                    TTexts.getStarted,
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


