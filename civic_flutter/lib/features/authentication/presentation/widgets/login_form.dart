import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/core/widgets/app_password_field.dart';
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

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
  var _isLoading = false;
  var _showPassword = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(authProvider.notifier);
    ref.listen(authProvider, (_, next) {
      switch (next) {
        case AuthStateLoading():
          _isLoading = true;
        case AuthStateNotLoading():
          _isLoading = false;
        case AuthStateError():
          TToastMessages.errorToast(
            next.error,
          );
        case AuthStateSuccess():
          context.pushReplacementNamed(
            AppRoutes.civic,
          );
        case AuthStateVerifyAccount():
          context.pushReplacementNamed(
            AppRoutes.verifyAccount,
          );
        case AuthStateInitiatePasswordReset():
          context.goNamed(
            AppRoutes.resetPassword,
          );
        default:
          return;
      }
    });

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppPasswordTextField(
              textController: _passwordController,
              validator: (value) => TValidator.validateEmptyText(
                'Password',
                value,
              ),
              showPassword: _showPassword,
              hintText: 'Enter your password',
              onSuffixPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => controller.navigateToResetPassword(widget.email,),
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
            Obx(
              () => FilledButton(
                onPressed: () => controller.signInWithEmailAndPassword(
                  email: widget.email,
                  password: _passwordController.text,
                  formKey: _formKey,
                ),
                child: const Text(
                  TTexts.signIn,
                ),
              ).withLoading(
                loading: _isLoading,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
