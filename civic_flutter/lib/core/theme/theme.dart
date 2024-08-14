import 'package:civic_flutter/core/constants/app_colors.dart';
import 'package:civic_flutter/core/constants/sizes.dart';
import 'package:civic_flutter/core/theme/text_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff018f45),
      primaryContainer: Color(0xffd0e4ff),
      secondary: Color(0xfff44236),
      secondaryContainer: Color(0xffffdbcf),
      tertiary: Color(0xff006875),
      tertiaryContainer: Color(0xff95f0ff),
      appBarColor: Color(0xffffdbcf),
      error: Color(0xffb00020),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 10,
    lightIsWhite: true,
    appBarStyle: FlexAppBarStyle.scaffoldBackground,
    textTheme: TTextTheme.lightTextTheme,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      splashType: FlexSplashType.inkSplash,
      elevatedButtonRadius: 10,
      inputDecoratorIsFilled: false,
      inputDecoratorUnfocusedBorderIsColored: false,
      alignedDropdown: true,
      dialogBackgroundSchemeColor: SchemeColor.surface,
      useInputDecoratorThemeInDialogs: true,
      appBarScrolledUnderElevation: 0,
      inputDecoratorRadius: TSizes.borderRadiusLg,
      filledButtonRadius: 100,
      outlinedButtonRadius: 100,
      outlinedButtonTextStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 20,
          color: TColors.dark,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
      ),
      filledButtonTextStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 20,
          color: TColors.textWhite,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
      ),
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: 'Montserrat',
  );

  static ThemeData darkTheme = FlexThemeData.dark(
    colors: const FlexSchemeColor(
      primary: Color(0xff018f45),
      primaryContainer: Color(0xff00325b),
      secondary: Color(0xfff44236),
      secondaryContainer: Color(0xffffdbcf),
      tertiary: Color(0xff86d2e1),
      tertiaryContainer: Color(0xff004e59),
      appBarColor: Color(0xfff44236),
      error: Color(0xffcf6679),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 10,
    darkIsTrueBlack: true,
    appBarStyle: FlexAppBarStyle.scaffoldBackground,
    textTheme: TTextTheme.darkTextTheme,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      splashType: FlexSplashType.inkSplash,
      elevatedButtonRadius: 10,
      inputDecoratorIsFilled: false,
      inputDecoratorUnfocusedBorderIsColored: false,
      alignedDropdown: true,
      dialogBackgroundSchemeColor: SchemeColor.surface,
      useInputDecoratorThemeInDialogs: true,
      appBarScrolledUnderElevation: 0,
      inputDecoratorRadius: TSizes.borderRadiusMd,
      filledButtonRadius: 100,
      outlinedButtonRadius: 100,
      outlinedButtonTextStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 20,
          color: TColors.textWhite,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
      ),
      filledButtonTextStyle: WidgetStatePropertyAll(
        TextStyle(
          fontSize: 20,
          color: TColors.textWhite,
          fontWeight: FontWeight.bold,
          fontFamily: 'Montserrat',
        ),
      ),
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
    fontFamily: 'Montserrat',
  );
}
