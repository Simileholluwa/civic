import 'dart:async';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_comment_provider.g.dart';

@riverpod
Future<Post> getComment(
  Ref ref,
  int commentId,
  bool isComment,
) async {
  final completer = Completer<Post>();

  final getComment = ref.read(getCommentDetailProvider);
  final result = await getComment(
    GetCommentParams(
      commentId,
      isComment,
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
}
