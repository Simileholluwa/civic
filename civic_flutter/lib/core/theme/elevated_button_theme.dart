import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TColors.textWhite,
      backgroundColor: TColors.primary,
      disabledForegroundColor: TColors.darkGrey,
      disabledBackgroundColor: TColors.buttonDisabled,
      side: const BorderSide(color: TColors.primary),
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 20,
        color: TColors.textWhite,
        fontWeight: FontWeight.w600,
        fontFamily: 'Jakarta',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          TSizes.buttonRadius,
        ),
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      side: const BorderSide(color: TColors.primary),
      padding: const EdgeInsets.symmetric(vertical: TSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 20,
        color: TColors.textWhite,
        fontWeight: FontWeight.w600,
        fontFamily: 'Jakarta',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          TSizes.buttonRadius,
        ),
      ),
    ),
  );
}
