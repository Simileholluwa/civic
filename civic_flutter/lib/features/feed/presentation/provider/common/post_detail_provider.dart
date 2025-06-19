// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'post_detail_provider.g.dart';

@riverpod
Future<Post> postDetail(
  Ref ref,
  int id,
  String draftType,
) async {
  final completer = Completer<Post>();
  if (id == 0) {
    final getPostDraft = ref.read(getPostDraftProvider);
    final result = await getPostDraft(GetPostDraftParams(
      draftType,
    ));
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
  } else {
    final retrievePost = ref.read(getPostProvider);
    final result = await retrievePost(
      GetPostParams(
        id,
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
}
