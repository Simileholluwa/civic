import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_list_provider.g.dart';

@Riverpod(keepAlive: true)
class PostList extends _$PostList {
  @override
  PagingStatus build() => PagingStatus.loadingFirstPage;
}
