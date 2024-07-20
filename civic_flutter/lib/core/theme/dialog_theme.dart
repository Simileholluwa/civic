
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/theme/text_theme.dart';
import 'package:flutter/material.dart';

class TDialogTheme {
  TDialogTheme._();

  static final lightDialogTheme = DialogTheme(
    backgroundColor: TColors.light,
    titleTextStyle: TTextTheme.lightTextTheme.titleMedium,
  );

  static final darkDialogTheme = DialogTheme(
    backgroundColor: TColors.dark,
      titleTextStyle: TTextTheme.darkTextTheme.titleMedium,
  );

}