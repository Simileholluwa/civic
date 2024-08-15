import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';

class AppPasswordTextField extends StatelessWidget {
  const AppPasswordTextField({
    required this.textController,
    required this.validator,
    this.prefixIcon = Iconsax.password_check,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.iconSize = 24,
    this.hintText = 'Enter a strong password',
    super.key,
  });

  final TextEditingController textController;
  final IconData prefixIcon;
  final String hintText;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return TextFormField(
        controller: textController,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            size: iconSize,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(
              right: TSizes.sm,
            ),
            child: IconButton(
              onPressed: () {
                if (ref.watch(showPasswordProvider)) {
                  ref.watch(showPasswordProvider.notifier).setValue(false);
                } else {
                  ref.watch(showPasswordProvider.notifier).setValue(true);
                }
              },
              icon: ref.watch(showPasswordProvider) == true
                  ? const Icon(
                      Icons.visibility,
                    )
                  : const Icon(
                      Icons.visibility_off,
                    ),
            ),
          ),
          hintText: hintText,
          errorStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
          errorMaxLines: 2,
        ),
        obscureText: ref.watch(showPasswordProvider),
        textInputAction: textInputAction,
        keyboardType: textInputType,
      );
    });
  }
}
