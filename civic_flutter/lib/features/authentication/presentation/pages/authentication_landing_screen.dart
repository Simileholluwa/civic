import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/constants/image_strings.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/email_form.dart';
import 'package:flutter/material.dart';

class AuthLandingScreen extends StatelessWidget {
  const AuthLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                TImageTexts.appLogo,
                height: 100,
              ),
              const SizedBox(
                height: TSizes.md,
              ),
              const EmailForm(),
            ],
          ),
        ),
      ),
    );
  }
}
