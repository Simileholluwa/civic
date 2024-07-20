
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.textController,
    required this.validator,
    this.prefixIcon,
    this.hintText = '',
    this.upperText = '',
    this.showUpperText = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.iconSize = 24,
    this.showPrefixIcon = true,
    this.readOnly = false,
    this.enabled = true,
    this.suffixIcon,
    this.autoFocus = false,
    this.onSave,
    super.key,
  });

  final TextEditingController textController;
  final IconData? prefixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final String hintText;
  final String upperText;
  final bool showUpperText;
  final bool readOnly;
  final bool showPrefixIcon;
  final double iconSize;
  final bool enabled;
  final IconButton? suffixIcon;
  final bool autoFocus;
  final void Function(String?)? onSave;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showUpperText)
          Text(
            upperText,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
          )
        else
          Container(),
        if (showUpperText)
          const SizedBox(
            height: TSizes.sm,
          )
        else
          const SizedBox(),
        TextFormField(
          controller: textController,
          validator: validator,
          enabled: enabled,
          readOnly: readOnly,
          onSaved: onSave,
          textCapitalization: TextCapitalization.sentences,
          decoration: InputDecoration(
            prefixIcon: showPrefixIcon
                ? Icon(
                    prefixIcon,
                    size: iconSize,
                  )
                : null,
            hintText: hintText,
            errorStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
            errorMaxLines: 2,
          ),
          textInputAction: textInputAction,
          keyboardType: textInputType,
          autofocus: autoFocus,
        ),
      ],
    );
  }
}
