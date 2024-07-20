import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/core/widgets/resend_link.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/password_reset_verification_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VerifyPasswordResetCodeScreen extends GetView<AuthController> {
  const VerifyPasswordResetCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AndroidBottomNav(
        child: Scaffold(
          appBar: AuthAppBar(
          icon: Iconsax.arrow_left_2,
          canGoBack: false,
          goBack: () => Get.back(
            id: 1,
          ),
        ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(
              TSizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader(
                  authTitle: 'Authenticate request',
                  authSubTitle: 'Enter the 6-digit code sent to the e-mail '
                      'address you provided.',
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                Form(
                  key: controller.state.formKeyVerifyPasswordResetCode,
                  child: const PasswordResetVerificationForm(),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                ResendLink(
                  onTap: () => controller.initiatePasswordRequest(
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
