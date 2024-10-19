import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppAndroidBottomNav extends StatelessWidget {
  const AppAndroidBottomNav({
    required this.child,
    super.key,
    this.systemNavBarStyle = FlexSystemNavBarStyle.scaffoldBackground,
  });
  final Widget child;
  final FlexSystemNavBarStyle systemNavBarStyle;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: systemNavBarStyle,
        useDivider: false,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: child,
    );
  }
}
