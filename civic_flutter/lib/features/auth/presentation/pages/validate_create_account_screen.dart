// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class ValidateCreateAccountScreen extends ConsumerWidget {
  const ValidateCreateAccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider.notifier);
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
                authTitle: TTexts.confirmEmail,
                authSubTitle: TTexts.confirmEmailSubTitle,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              ValidateCreateAccountForm(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              AppResendLink(
                onTap: () {
                  authNotifier.createAccountRequest();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
