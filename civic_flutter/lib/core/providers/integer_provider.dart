import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'integer_provider.g.dart';

@riverpod
class PageChanged extends _$PageChanged {
  @override
  int build() => 0;

  void carouselPageChanged(int index, dynamic reason) {
    state = index;
  }
}
