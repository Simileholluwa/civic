import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
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
