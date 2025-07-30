import 'package:civic_flutter/core/core.dart';
import 'package:flutter/material.dart';

abstract class ThemeService {
  String get previousThemeName;
  ThemeData get initial;
  save(String newThemeName);
  ThemeData getByName(String name);
}

class ThemeServiceImpl implements ThemeService {
  ThemeServiceImpl({
    required LocalStorage prefs,
  }) : _prefs = prefs;

  final LocalStorage _prefs;

  final allThemes = <String, ThemeData>{
    'dark': TAppTheme.darkTheme,
    'light': TAppTheme.lightTheme,
  };

  @override
  String get previousThemeName {
    String? themeName = _prefs.getString('previousThemeName');
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark;
      themeName = isPlatformDark ? 'light' : 'dark';
    }
    return themeName;
  }

  @override
  get initial {
    String? themeName = _prefs.getString('theme');
    if (themeName == null) {
      final isPlatformDark =
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark;
      themeName = isPlatformDark ? 'dark' : 'light';
    }
    return allThemes[themeName]!;
  }

  @override
  save(String newThemeName) {
    var currentThemeName = _prefs.getString('theme');
    if (currentThemeName != null) {
      _prefs.setString('previousThemeName', currentThemeName);
    }
    _prefs.setString('theme', newThemeName);
  }

  @override
  ThemeData getByName(String name) {
    return allThemes[name]!;
  }
}
