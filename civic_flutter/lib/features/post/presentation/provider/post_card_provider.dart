import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_card_provider.g.dart';

@riverpod
class PostCardWidget extends _$PostCardWidget {
  @override
  PostCardState build(Post post) {
    return PostCardState.populate(post);
  }
}