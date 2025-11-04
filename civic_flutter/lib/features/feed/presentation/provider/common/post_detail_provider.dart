import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_detail_provider.g.dart';

@riverpod
Future<Post> postDetail(
  Ref ref,
  int id,
  String draftType,
  Post? post,
) async {
  final completer = Completer<Post>();
  if (id == 0) {
    final getPostDraft = ref.read(getPostDraftProvider);
    final result = await getPostDraft(
      GetPostDraftParams(
        draftType,
      ),
    );
    result.fold(
      (error) {
        completer.completeError({
          'message': error.message,
          'action': error.action,
        });
      },
      completer.complete,
    );
    return completer.future;
  } else if (post != null) {
    completer.complete(post);
    return completer.future;
  } else {
    final retrievePost = ref.read(getPostProvider);
    final result = await retrievePost(
      GetPostParams(
        id,
      ),
    );

    return result.fold(
      (error) {
        completer.completeError({
          'message': error.message,
          'action': error.action,
        });
        return completer.future;
      },
      (post) {
        completer.complete(post);
        return completer.future;
      },
    );
  }
}
