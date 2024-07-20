
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class SignUpScreen extends GetView<AuthController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidBottomNav(
      child: Scaffold(
        appBar: const AuthAppBar(icon: Iconsax.arrow_left_2,),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(TSizes.defaultSpace,),
          child: Column(
            children: [
              const AuthHeader(
                authTitle: 'Create password',
                authSubTitle: 'Use a combination of alphabets, '
                    'numbers, and symbols',
              ),
              Form(
                key: controller.state.formKeySignUp,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: const SignUpForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
