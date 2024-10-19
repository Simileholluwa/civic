import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app/app_button.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';

class PasswordResetVerificationForm extends ConsumerStatefulWidget {
  const PasswordResetVerificationForm({
    super.key,
    required this.email,
  });

  final String email;

  @override
  ConsumerState<PasswordResetVerificationForm> createState() =>
      _PasswordResetVerificationFormState();
}

class _PasswordResetVerificationFormState
    extends ConsumerState<PasswordResetVerificationForm> {
  final _formKey = GlobalKey<FormState>();
  final _codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    ref.listen(authProvider, (_, next) {
      switch (next) {
        case AuthStateNewPassword():
          context.goNamed(
            AppRoutes.createNewPassword,
            pathParameters: {
              'code': next.code,
              'email': next.email,
            },
          );
        default:
          return;
      }
    });
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
                ref.watch(authProvider.notifier).navigateToCreateNewPassword(
                      _codeController.text,
                      widget.email,
                      context,
                    ),
            child: const Text(
              TTexts.tContinue,
            ),
          ).withLoading(
            loading: false,
          ),
        ],
      ),
    );
  }
}
