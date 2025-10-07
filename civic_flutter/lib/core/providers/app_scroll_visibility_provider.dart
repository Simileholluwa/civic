import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_scroll_visibility_provider.g.dart';

@riverpod
class AppScrollVisibility extends _$AppScrollVisibility {
  @override
  bool build(bool? value) => value ?? true;

  void toggleVisibility() {
    state = !state;
  }

  void hide() {
    state = false;
  }

  void show() {
    state = true;
  }
}
