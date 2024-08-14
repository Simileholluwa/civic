import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/core/widgets/resend_link.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/password_reset_verification_form.dart';

class VerifyPasswordResetCodeScreen extends StatelessWidget {
  const VerifyPasswordResetCodeScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: AndroidBottomNav(
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
                  authTitle: 'Authenticate request',
                  authSubTitle: 'Enter the 6-digit code sent to the e-mail '
                      'address you provided.',
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                PasswordResetVerificationForm(
                  email: email,
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
      ),
    );
  }
}
