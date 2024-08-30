import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'string_provider.g.dart';

@Riverpod(keepAlive: true)
class PostText extends _$PostText {
  @override
  String build() => '';

  void getPostText(String text) {
    state = text;
  }
}
