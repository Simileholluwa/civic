import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bottom_nav_visibility_provider.g.dart';

@riverpod
class BottomNavVisibility extends _$BottomNavVisibility {
  @override
  bool build() => true;

  void show() => state = true;
  void hide() => state = false;
  void toggle() => state = !state;
}
