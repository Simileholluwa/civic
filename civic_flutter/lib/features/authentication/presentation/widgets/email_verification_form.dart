// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';

class EmailVerificationForm extends ConsumerStatefulWidget {
  const EmailVerificationForm({
    super.key,
    required this.email,
    required this.password,
    required this.politicalStatus,
    required this.username,
  });

  final String email;
  final String password;
  final int politicalStatus;
  final String username;

  @override
  ConsumerState<EmailVerificationForm> createState() =>
      _EmailVerificationFormState();
}

class _EmailVerificationFormState extends ConsumerState<EmailVerificationForm> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  var _isLoading = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(authProvider.notifier);
    ref.listen(
      authProvider,
      (_, next) {
        switch (next) {
          case AuthStateLoading():
            _isLoading = true;
          case AuthStateNotLoading():
            _isLoading = false;
          case AuthStateError():
            TToastMessages.errorToast(next.error);
          case AuthStateSuccessfulRequest():
            TToastMessages.successToast(next.successMessage);
          case AuthStateVerifyAccount():
            context.pushReplacementNamed(
              AppRoutes.verifyAccount,
            );
          default:
            return;
        }
      },
    );

    final isDark = THelperFunctions.isDarkMode(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            controller: _codeController,
            validator: TValidator.validateOTP,
            obscureText: true,
            keyboardType: TextInputType.text,
            obscuringWidget: const Icon(
              Icons.circle,
              size: 15,
            ),
            errorTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
            defaultPinTheme: PinTheme(
              width: 60,
              height: 60,
              textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isDark ? TColors.dark : TColors.light,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          Obx(
            () => FilledButton(
              onPressed: () => controller.validateCreateAccount(
                code: _codeController.text,
                email: widget.email,
                politicalStatus: widget.politicalStatus,
              ),
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: _isLoading,
            ),
          ),
        ],
      ),
    );
  }
}
