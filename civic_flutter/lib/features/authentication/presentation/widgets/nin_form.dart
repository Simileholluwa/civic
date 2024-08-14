import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:civic_flutter/core/widgets/app_text_field.dart';
import 'package:civic_flutter/features/authentication/presentation/provider/auth_provider.dart';
import 'package:civic_flutter/features/authentication/presentation/widgets/dual_button.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/constants/text_strings.dart';
import 'package:civic_flutter/core/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  @override
  void dispose() {
    _ninController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              onTapSkipButton: () =>
                  ref.read(authProvider.notifier).navigateToMenu(
                        context,
                      ),
              activeButtonText: TTexts.tContinue,
              onTapActiveButton: () =>
                  ref.read(authProvider.notifier).searchNinRecord(
                        ninNumber: _ninController.text.trim(),
                        formKey: _formKey,
                        context: context,
                      ),
              activeButtonLoading: ref.watch(searchNinLoadingProvider),
              skipButtonLoading: false,
            ),
          ],
        ),
      ),
    );
  }
}
