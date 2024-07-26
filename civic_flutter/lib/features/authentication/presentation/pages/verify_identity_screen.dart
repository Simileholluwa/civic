
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/nin_form.dart';
import 'package:flutter/material.dart';

class VerifyIdentityScreen extends StatelessWidget {
  const VerifyIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AndroidBottomNav(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: AuthAppBar(
            showLeading: false,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(
              TSizes.defaultSpace,
            ),
            child: Column(
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
