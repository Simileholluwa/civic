
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AppPasswordTextField extends StatelessWidget {
  const AppPasswordTextField({
    required this.textController,
    required this.validator,
    required this.showPassword,
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
  final RxBool showPassword;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        controller: textController,
        validator: validator,
        decoration: InputDecoration(
          prefixIcon: Icon(
            prefixIcon,
            size: iconSize,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: TSizes.sm,),
            child: IconButton(
              onPressed: () {
                showPassword.value = !showPassword.value;
              },
              icon: showPassword.isTrue
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
        obscureText: showPassword.value,
        textInputAction: textInputAction,
        keyboardType: textInputType,
      ),
    );
  }
}
