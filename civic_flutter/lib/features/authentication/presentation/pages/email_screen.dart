import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/email_form.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidBottomNav(
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
          child: const Column(
            children: [
              AuthHeader(
                authTitle: 'E-mail address',
                authSubTitle: 'Enter your e-mail address below to get started.',
              ),
              EmailForm(),
            ],
          ),
        ),
      ),
    );
  }
}
