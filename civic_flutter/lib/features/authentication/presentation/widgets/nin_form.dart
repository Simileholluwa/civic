import 'package:civic_flutter/core/router/route_names.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/widgets/app_text_field.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';
import 'package:civic_flutter/features/authentication/presentation/state/auth_state_entity.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/dual_button.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class NinForm extends ConsumerStatefulWidget {
  const NinForm({
    super.key,
  });

  @override
  ConsumerState<NinForm> createState() => _NinFormState();
}

class _NinFormState extends ConsumerState<NinForm> {
  final _formKey = GlobalKey<FormState>();
  final _ninController = TextEditingController();
  var _isLoading = false;

  @override
  void dispose() {
    _ninController.dispose();
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
        case AuthStateMenu():
          context.goNamed(
            AppRoutes.civic,
          );
        case AuthStateNin():
          context.goNamed(
            AppRoutes.confirmNinDetails,
            pathParameters: {
              'ninRecord': next.ninRecord,
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
          children: [
            AppTextField(
              textController: _ninController,
              hintText: 'National Identification Number',
              validator: TValidator.validateNin,
              textInputType: TextInputType.number,
              prefixIcon: FontAwesomeIcons.idCardClip,
              iconSize: 22,
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            DualButton(
              onTapSkipButton: controller.navigateToMenu,
              activeButtonText: TTexts.tContinue,
              onTapActiveButton: () => controller.searchNinRecord(
                ninNumber: _ninController.text.trim(),
                formKey: _formKey,
              ),
              activeButtonLoading: _isLoading,
              skipButtonLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
