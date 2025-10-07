import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class VerifyPasswordResetCodeScreen extends ConsumerWidget {
  const VerifyPasswordResetCodeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
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
              const PasswordResetVerificationForm(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Consumer(
                builder: (context, ref, _) {
                  return AppResendLink(
                    onTap: () async {
                      await ref
                          .watch(
                            authProvider.notifier,
                          )
                          .resendPasswordResetCode(
                            email: authState.resetPasswordEmail,
                          );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
