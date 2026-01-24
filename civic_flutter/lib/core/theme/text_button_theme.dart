import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class TTextButtonTheme {
  TTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      iconColor: const WidgetStatePropertyAll(
        TColors.primary,
      ),
      textStyle: WidgetStatePropertyAll(
        const TextStyle().copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: TColors.primary,
        ),
      ),
      foregroundColor: const WidgetStatePropertyAll(
        TColors.primary,
      ),
      overlayColor: WidgetStatePropertyAll(
        TColors.primary.withAlpha(30),
      ),
    ),
  );

  static final darkTextButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      iconColor: const WidgetStatePropertyAll(
        TColors.primary,
      ),
      textStyle: WidgetStatePropertyAll(
        const TextStyle().copyWith(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: TColors.primary,
        ),
      ),
      foregroundColor: const WidgetStatePropertyAll(
        TColors.primary,
      ),
      overlayColor: WidgetStatePropertyAll(
        TColors.primary.withAlpha(30),
      ),
    ),
  );
}
