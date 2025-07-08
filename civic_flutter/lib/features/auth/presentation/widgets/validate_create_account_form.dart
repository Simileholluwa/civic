// ignore_for_file: use_build_context_synchronously

import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';

class ValidateCreateAccountForm extends ConsumerWidget {
  const ValidateCreateAccountForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.read(authProvider.notifier);
    return Form(
      key: authState.verificationCodeFormKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            controller: authState.verificationCodeController,
            validator: TValidator.validateOTP,
            obscureText: true,
            keyboardType: TextInputType.text,
            onChanged: (code) {
              authNotifier.setVerificationCode(code);
            },
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
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
            height: 55,
            child: FilledButton(
              onPressed: () async {
                final validated = await authNotifier.validateCreateAccount();
                if (validated) {
                  context.push(
                    ProjectRoutes.namespace,
                  );
                }
              },
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: ref.watch(validatCreateAccountLoadingProvider),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          AppResendLink(
            onTap: () {
              authNotifier.createAccountRequest();
            },
          ),
        ],
      ),
    );
  }
}
