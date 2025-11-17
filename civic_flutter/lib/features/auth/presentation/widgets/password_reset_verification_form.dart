import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class PasswordResetVerificationForm extends ConsumerWidget {
  const PasswordResetVerificationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final formKey = ref.read(
      authProvider.select(
        (s) => s.passwordResetCodeFormKey,
      ),
    );
    final controller = ref.read(
      authProvider.select(
        (s) => s.passwordResetCodeController,
      ),
    );
    return Form(
      key: formKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            controller: controller,
            validator: TValidator.validateOTP,
            obscureText: true,
            onChanged: authNotifier.setPasswordResetCode,
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
                color: Theme.of(context).cardColor,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          FilledButton(
            onPressed: () async {
              await context.push(
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
