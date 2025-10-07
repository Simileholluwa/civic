import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateAccountRequestForm extends ConsumerWidget {
  const CreateAccountRequestForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);
    return Form(
      key: authState.newAccountPasswordFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppPasswordField(
              textController: authState.newAccountPasswordController,
              validator: TValidator.validatePassword,
              onChanged: (value) {
                authNotifier.setNewAccountPassword(value!);
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            const TermsAndConditions(),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              height: 55,
              child: FilledButton(
                onPressed: () async {
                  final isValid = authState
                      .newAccountPasswordFormKey.currentState!
                      .validate();
                  if (!isValid) return;
                  await authNotifier.createAccountRequest();
                  if (context.mounted) {
                    await context.push(
                      '/auth/signUp/validateCreateAccount',
                    );
                  }
                },
                child: const Text(
                  TTexts.tContinue,
                ),
              ).withLoading(
                loading: ref.watch(createAccountLoadingProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
