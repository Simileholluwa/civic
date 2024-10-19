// ignore_for_file: lines_longer_than_80_chars

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth/auth_header.dart';
import 'package:civic_flutter/core/widgets/app/app_resend_link.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/verify_nin_email_otp.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class VerifyNinEmailOTPScreen extends StatelessWidget {
  const VerifyNinEmailOTPScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: const AuthAppBar(
          icon: Iconsax.arrow_left_2,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom:
                MediaQuery.of(context).viewInsets.bottom + TSizes.defaultSpace,
            top: TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthHeader(
                authTitle: 'Verify OTP',
                authSubTitle: 'Enter the one time password sent to your email',
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const VerifyNinEmailOTP(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              AppResendLink(
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
