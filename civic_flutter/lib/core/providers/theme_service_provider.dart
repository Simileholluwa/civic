import 'package:civic_flutter/core/core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_service_provider.g.dart';

@riverpod
ThemeService themeService(Ref ref) {
  return ThemeServiceImpl(
    prefs: ref.read(
      localStorageProvider,
    ),
  );
}
