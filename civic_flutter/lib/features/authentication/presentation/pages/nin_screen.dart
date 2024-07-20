import 'package:civic_flutter/core/widgets/android_bottom_nav.dart';
import 'package:civic_flutter/core/widgets/auth_app_bar.dart';
import 'package:civic_flutter/core/widgets/auth_header.dart';
import 'package:civic_flutter/features/authentication/presentation/controller/auth_controller.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/nin_form.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NinScreen extends GetView<AuthController> {
  const NinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidBottomNav(
      child: Scaffold(
        appBar: const AuthAppBar(
          icon: Iconsax.arrow_left_2,
        ),
        body: Expanded(
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: TSizes.defaultSpace,
              right: TSizes.defaultSpace,
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  TSizes.defaultSpace,
              top: TSizes.defaultSpace,
            ),
            children: [
              const AuthHeader(
                authTitle: 'Verify your',
                authSubTitle: 'Verify your identity in one simple step.',
              ),
              Form(
                key: controller.state.formKeyNin,
                child: const NinForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
