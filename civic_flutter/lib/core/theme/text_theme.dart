import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.lora().fontFamily,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.lora().fontFamily,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w400,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  );
}
