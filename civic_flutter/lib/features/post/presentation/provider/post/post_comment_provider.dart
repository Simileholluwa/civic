// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'post_comment_provider.g.dart';

@riverpod
Future<Post> getPostComment(
  Ref ref,
  int commentId,
  bool isComment,
) async {
  final completer = Completer<Post>();

  final getComment = ref.read(getCommentProvider);
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
    (post) {
      completer.complete(post);
    },
  );
  return completer.future;
}
