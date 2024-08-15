import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';

class ValidateCreateAccountForm extends ConsumerStatefulWidget {
  const ValidateCreateAccountForm({
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
  ConsumerState<ValidateCreateAccountForm> createState() =>
      _EmailVerificationFormState();
}

class _EmailVerificationFormState
    extends ConsumerState<ValidateCreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          FilledButton(
            onPressed: () =>
                ref.read(authProvider.notifier).validateCreateAccount(
                      code: _codeController.text,
                      email: widget.email,
                      politicalStatus: widget.politicalStatus,
                      context: context,
                      password: widget.password,
                    ),
            child: const Text(
              TTexts.tContinue,
            ),
          ).withLoading(
            loading: ref.watch(validatCreateAccountLoadingProvider),
          ),
        ],
      ),
    );
  }
}
