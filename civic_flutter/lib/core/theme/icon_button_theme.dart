
import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TIconButtonTheme {
  TIconButtonTheme._();

  static final lightIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      iconColor: const WidgetStatePropertyAll(
        TColors.dark,
      ),
      foregroundColor: const WidgetStatePropertyAll(
        TColors.dark,
      ),
      overlayColor: WidgetStatePropertyAll(
        TColors.primary.withAlpha(30),
      ),
    ),
  );

  static final darkIconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      iconColor: const WidgetStatePropertyAll(
        TColors.light,
      ),
      foregroundColor: const WidgetStatePropertyAll(
        TColors.light,
      ),
      overlayColor: WidgetStatePropertyAll(
        TColors.primary.withAlpha(30),
      ),
    ),
  );
}
