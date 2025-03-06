// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/auth/auth.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'post_detail_provider.g.dart';

@riverpod
Future<Post?> postDetail(
  Ref ref,
  DraftPost? draftPost,
  int id,
) async {
  if (id == 0 && draftPost == null) {
    final userRecord = ref.watch(getUserRecordProvider);
    final result = userRecord(NoParams());
    return result.fold((l) {
      log('Error in postDetail: ${l.message}');
      return null;
    }, (record) {
      if (record == null) {
        return null;
      }
      return Post(
        ownerId: record.id!,
        owner: record,
      );
    });
  } else if (id == 0 && draftPost != null) {
    final userRecord = ref.watch(getUserRecordProvider).call(
          NoParams(),
        );
    return userRecord.fold((l) {
      return null;
    }, (record) {
      if (record == null) {
        return null;
      }
      return PostHelperFunctions.createPostFromDraftPost(
        draftPost,
        ref,
      );
    });
  } else {
    final retrievePost = ref.read(getPostProvider);
    final result = await retrievePost(
      GetPostParams(
        id,
      ),
    );

    return result.fold(
      (error) => null,
      (post) {
        if (post == null) {
          return null;
        }
        return post;
      },
    );
  }
}
