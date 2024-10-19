import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/app/app_android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/nin_form.dart';
import 'package:flutter/material.dart';

class VerifyIdentityScreen extends StatelessWidget {
  const VerifyIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAndroidBottomNav(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: const AuthAppBar(
            showLeading: false,
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(
              left: TSizes.defaultSpace,
              right: TSizes.defaultSpace,
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  TSizes.defaultSpace,
              top: TSizes.defaultSpace,
            ),
            child: const Column(
              children: [
                AuthHeader(
                  authTitle: 'Verify your identity',
                  authSubTitle: 'Access more possibilities on CIVIC by '
                      "verifying your identity. It's easy!",
                ),
                NinForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
