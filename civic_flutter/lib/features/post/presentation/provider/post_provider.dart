import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_provider.g.dart';

@Riverpod(keepAlive: true)
class Post extends _$Post {
  @override
  bool build() => true;
}
