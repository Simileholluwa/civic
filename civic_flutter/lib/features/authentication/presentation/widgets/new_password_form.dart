// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/core/widgets/app_password_field.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';

class NewPasswordForm extends ConsumerStatefulWidget {
  const NewPasswordForm({
    super.key,
    required this.code,
    required this.email,
  });

  final String code;
  final String email;

  @override
  ConsumerState<NewPasswordForm> createState() => _NewPasswordFormState();
}

class _NewPasswordFormState extends ConsumerState<NewPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  var _showPassword = false;
  var _isLoading = false;

  @override
  void dispose() {
    _newPasswordController.dispose();
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
          TToastMessages.errorToast(next.error);
        case AuthStateSuccessfulRequest():
          TToastMessages.successToast(next.successMessage);
        case AuthStateGuest():
          context.pushReplacementNamed(
            AppRoutes.authLandingScreen,
          );
        default:
          return;
      }
    });

    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppPasswordTextField(
              textController: _newPasswordController,
              validator: TValidator.validatePassword,
              showPassword: _showPassword,
              onSuffixPressed: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Obx(
              () => FilledButton(
                onPressed: () => controller.resetPassword(
                  formKey: _formKey,
                  email: widget.email,
                  newPassword: _newPasswordController.text,
                  code: widget.code,
                ),
                child: const Text(
                  TTexts.tContinue,
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
