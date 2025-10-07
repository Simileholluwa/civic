
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
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
