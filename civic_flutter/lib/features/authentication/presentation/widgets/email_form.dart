import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:civic_flutter/core/widgets/app_button.dart';
import 'package:civic_flutter/core/widgets/app_text_field.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class EmailForm extends ConsumerStatefulWidget {
  const EmailForm({
    super.key,
  });

  @override
  ConsumerState<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends ConsumerState<EmailForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  var _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
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
        case AuthStateLogin():
          final username = next.username;
          final email = next.email;
          context.goNamed(
            AppRoutes.login,
            pathParameters: {
              'email': email,
              'username': username,
            },
          );
        case AuthStatePoliticalStatus():
          context.goNamed(
            AppRoutes.politicalStatus,
            pathParameters: {
              'email': next.email,
            },
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
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Obx(
              () => FilledButton(
                onPressed: () => controller.checkIfNewUser(
                  email: _emailController.text.trim(),
                  formKey: _formKey,
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
