import 'package:civic_flutter/core/core.dart';
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
    this.onTap,
    this.onSave,
    this.hintStyle,
    this.maxLines,
    this.style,
    this.onChanged,
    this.focusedBorder,
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
  final TextStyle? hintStyle;
  final TextStyle? style;
  final void Function(String?)? onSave;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final int? maxLines;
  final InputBorder? focusedBorder;

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
                  color: Theme.of(context).hintColor,
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
          onTap: onTap,
          onChanged: onChanged,
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
            hintStyle: hintStyle ?? Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).hintColor,
                ),
            errorMaxLines: 2,
            contentPadding: EdgeInsets.fromLTRB( showPrefixIcon ? 0 : 16, 16, 16, 16),
            focusedBorder: focusedBorder,
          ),
          style: style ?? Theme.of(context).textTheme.bodyMedium,
          
          textInputAction: textInputAction,
          keyboardType: textInputType,
          autofocus: autoFocus,
          maxLines: maxLines,
        ),
      ],
    );
  }
}
