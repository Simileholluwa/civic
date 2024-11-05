// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/local_storage/storage_utility.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/usecases/retrieve_post_use_case.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_service_provider.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_detail_provider.g.dart';

@riverpod
Future<Post?> postDetail(
  PostDetailRef ref,
  DraftPost? draftPost,
  int id,
) async {
  if (id == 0 && draftPost == null) {
    final me = ref.read(meUseCaseProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      await AppLocalStorage.to.setInt(
        'userId',
        currentUser.userInfo!.id!,
      );
      return Post(
        ownerId: currentUser.userInfo!.id!,
        postType: PostType.none,
        owner: currentUser,
        text: '',
        imageUrls: [],
        videoUrl: '',
        taggedUsers: [],
        locations: [],
        mentions: [],
        tags: [],
      );
    });
  } else if (id == 0 && draftPost != null) {
    final me = ref.read(meUseCaseProvider);
    final result = await me(NoParams());
    return result.fold((error) {
      return null;
    }, (currentUser) async {
      await AppLocalStorage.to.setInt(
        'userId',
        currentUser.userInfo!.id!,
      );
      return Post(
        ownerId: currentUser.userInfo!.id!,
        postType: PostType.none,
        owner: currentUser,
        text: draftPost.text,
        imageUrls: draftPost.imagesPath,
        videoUrl: draftPost.videoPath,
        taggedUsers: draftPost.taggedUsers,
        locations: draftPost.locations,
        mentions: draftPost.mentions,
        tags: draftPost.tags,
      );
    });
  } else {
    final retrievePost = ref.read(retrievePostProvider);
    final result = await retrievePost(
      RetrievePostParams(
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
        log(post.toString());
        return post.copyWith(
          owner: owner,
        );
      },
    );
  }
}
