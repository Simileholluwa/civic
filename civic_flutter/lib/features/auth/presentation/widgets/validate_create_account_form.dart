import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class ValidateCreateAccountForm extends ConsumerWidget {
  const ValidateCreateAccountForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final validateLoading = ref.watch(
      authProvider.select(
        (s) => s.validatCreateAccountLoading,
      ),
    );
    final formKey = ref.read(
      authProvider.select(
        (s) => s.verificationCodeFormKey,
      ),
    );
    final controller = ref.read(
      authProvider.select(
        (s) => s.verificationCodeController,
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
            keyboardType: TextInputType.text,
            onChanged: authNotifier.setVerificationCode,
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
          FilledButton(
            onPressed: () async {
              final validated = await authNotifier.validateCreateAccount();
              if (validated && context.mounted) {
                final res = await uploadProfilePicture(context);
                if (res! && context.mounted) {
                  context.go(
                    ProjectRoutes.namespace,
                  );
                  ref.invalidate(authProvider);
                }
              }
            },
            child: const Text(
              TTexts.tContinue,
            ),
          ).withLoading(
            loading: validateLoading,
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          AppResendLink(
            onTap: authNotifier.createAccountRequest,
          ),
        ],
      ),
    );
  }
}
