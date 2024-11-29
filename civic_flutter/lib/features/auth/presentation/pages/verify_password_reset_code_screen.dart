import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class VerifyPasswordResetCodeScreen extends StatelessWidget {
  const VerifyPasswordResetCodeScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: const AuthAppBar(
          icon: Iconsax.arrow_left_2,
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
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
              Consumer(
                builder: (context, ref, _) {
                  return AppResendLink(
                    onTap: () {
                      ref.watch(authProvider.notifier).resendPasswordResetCode(
                        email: email,
                      );
                    },
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
