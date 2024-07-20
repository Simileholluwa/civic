
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/nin_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyIdentityScreen extends GetView<AuthController> {
  const VerifyIdentityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidBottomNav(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          appBar: const AuthAppBar(
            showLeading: false,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(
              TSizes.defaultSpace,
            ),
            child: Column(
              children: [
                const AuthHeader(
                  authTitle: 'Verify your identity',
                  authSubTitle: 'Access more possibilities on CIVIC by '
                      "verifying your identity. It's easy!",
                ),
                Form(
                  key: controller.state.formKeyNin,
                  child: const NinForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
