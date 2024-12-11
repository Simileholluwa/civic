// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';
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
    final me = ref.read(meUseCaseProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      return Post(
        ownerId: currentUser.userInfo!.id!,
        owner: currentUser,
      );
    });
  } else if (id == 0 && draftPost != null) {
    final me = ref.read(meUseCaseProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      return PostHelperFunctions.createPostFromDraftPost(
        draftPost,
        currentUser,
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
      (post) async {
        if (post == null) {
          return null;
        }
        final me = ref.read(meUseCaseProvider);
        final userRecord = await me(NoParams());
        final owner = userRecord.fold((error) => null, (user) => user);
        if (owner == null) return null;
        return post.copyWith(
          owner: owner,
        );
      },
    );
  }
}
