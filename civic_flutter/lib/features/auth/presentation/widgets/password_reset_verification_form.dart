import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class PasswordResetVerificationForm extends ConsumerWidget {
  const PasswordResetVerificationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);
    final isDark = THelperFunctions.isDarkMode(context);
    return Form(
      key: authState.passwordResetCodeFormKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            controller: authState.passwordResetCodeController,
            validator: TValidator.validateOTP,
            obscureText: true,
            onChanged: (code) {
              authNotifier.setPasswordResetCode(code);
            },
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
            onPressed: () {
              context.pushNamed(
                AppRoutes.createNewPassword,
              );
            },
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
