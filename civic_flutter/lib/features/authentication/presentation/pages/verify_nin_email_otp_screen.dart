// ignore_for_file: lines_longer_than_80_chars

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/core/widgets/resend_link.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/verify_nin_email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VerifyNinEmailOTPScreen extends GetView<AuthController> {
  const VerifyNinEmailOTPScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ninData = controller.state.userNinEntity?.value;
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
                    'Enter the one time password sent to ${controller.redactEmail(
                  ninData!.email!,
                )}',
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Form(
                key: controller.state.formKeyVerifyNinEmail,
                child: const VerifyNinEmailOTP(),
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
