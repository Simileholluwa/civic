import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:civic_flutter/core/widgets/app/app_button.dart';
import 'package:civic_flutter/core/widgets/app/app_password_field.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({
    required this.email,
    super.key,
  });

  final String email;

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(authProvider.notifier);
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppPasswordField(
              textController: _passwordController,
              validator: (value) => TValidator.validateEmptyText(
                'Password',
                value,
              ),
              hintText: 'Enter your password',
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => controller.navigateToResetPassword(
                    widget.email,
                    context,
                  ),
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
              onPressed: () => controller.signInWithEmailAndPassword(
                email: widget.email,
                password: _passwordController.text,
                formKey: _formKey,
                context: context,
              ),
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
