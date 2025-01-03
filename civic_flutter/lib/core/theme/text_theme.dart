
import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: TColors.dark,
      fontFamily: GoogleFonts.lora().fontFamily,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: TColors.dark,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: TColors.dark,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: TColors.dark,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: TColors.dark,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: TColors.dark,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: TColors.dark,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: TColors.dark,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: TColors.dark.withValues(alpha: 0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TColors.dark,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TColors.dark.withValues(alpha: 0.5),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      color: TColors.light,
      fontFamily: GoogleFonts.lora().fontFamily,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      color: TColors.light,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: TColors.light,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: TColors.light,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      color: TColors.light,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: TColors.light,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: TColors.light,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: TColors.light,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: TColors.light.withValues(alpha: 0.5),
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TColors.light,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: TColors.light.withValues(alpha: 0.5),
    ),
  );
}
