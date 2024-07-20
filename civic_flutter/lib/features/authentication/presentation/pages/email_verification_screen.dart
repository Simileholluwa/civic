import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/core/widgets/resend_link.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/email_verification_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EmailVerificationScreen extends GetView<AuthController> {
  const EmailVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidBottomNav(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: const AuthAppBar(
            icon: Iconsax.arrow_left_2,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(
              TSizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader(
                  authTitle: TTexts.confirmEmail,
                  authSubTitle: TTexts.confirmEmailSubTitle,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Form(
                  key: controller.state.formKeyVerifyEmail,
                  child: const EmailVerificationForm(),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                ResendLink(
                  onTap: () => controller.validateCreateAccount(
                    shouldNavigate: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
