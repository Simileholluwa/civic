// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/core/widgets/app_text_field.dart';

class ResetPasswordForm extends ConsumerStatefulWidget {
  const ResetPasswordForm({
    super.key,
    required this.email,
  });

  final String email;

  @override
  ConsumerState<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends ConsumerState<ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(
      text: widget.email,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(authProvider.notifier);
    ref.listen(
      authProvider,
      (_, next) {
        switch (next) {
          case AuthStateLoading():
            _isLoading = true;
          case AuthStateNotLoading():
            _isLoading = false;
          case AuthStateError():
            TToastMessages.errorToast(
              next.error,
            );
          case AuthStateSuccessfulRequest():
            TToastMessages.successToast(
              next.successMessage,
            );
          case AuthStateVerifyPasswordReset():
            context.goNamed(
              AppRoutes.verifyResetPasswordCode,
              pathParameters: {'email': next.email,},
            );
          default:
            return;
        }
      },
    );
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppTextField(
              textController: _emailController,
              prefixIcon: Iconsax.message,
              hintText: 'your-email@domain.com',
              validator: TValidator.validateEmail,
              textInputType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            FilledButton(
              onPressed: () => controller.initiatePasswordRequest(
                formKey: _formKey,
                email: widget.email,
              ),
              child: const Text(
                TTexts.tContinue,
              ),
            ).withLoading(
              loading: _isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
