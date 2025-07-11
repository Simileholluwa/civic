// ignore_for_file: use_build_context_synchronously
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider.notifier);
    final authState = ref.watch(authProvider);

    return Form(
      key: authState.passwordFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppPasswordField(
              textController: authState.passwordController,
              validator: (value) => TValidator.validateEmptyText(
                'Password',
                value,
              ),
              hintText: 'Enter your password',
              onChanged: (value) => authNotifier.setPassword(value!),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      AppRoutes.resetPassword,
                    );
                  },
                  child: Text(
                    'Forgot password?',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: TColors.primary,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FilledButton(
              onPressed: () async {
                final isValid =
                    authState.passwordFormKey.currentState!.validate();
                if (!isValid) return;
                final userRecord =
                    await authNotifier.signInWithEmailAndPassword();
                if (userRecord != null) {
                  context.go(ProjectRoutes.namespace);
                  ref.invalidate(authProvider);
                } else {
                  return;
                }
              },
              child: const Text(
                TTexts.signIn,
              ),
            ).withLoading(
              loading: ref.watch(signInLoadingProvider),
            ),
          ],
        ),
      ),
    );
  }
}
