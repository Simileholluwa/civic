// ignore_for_file: lines_longer_than_80_chars

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/core/widgets/resend_link.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/verify_nin_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VerifyNinOTPScreen extends GetView<AuthController> {
  const VerifyNinOTPScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final verificationId = Get.parameters['verificationId'];
    final phoneNumber = Get.parameters['phoneNumber'];
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthHeader(
                authTitle: 'Verify OTP',
                authSubTitle:
                    'Enter the one time password sent to ${controller.redactString(
                  phoneNumber!,
                  3,
                  start: 6,
                )}',
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Form(
                key: controller.state.formKeyVerifyNin,
                child: VerifyNinOTP(
                  verificationId: verificationId!,
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ResendLink(
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
