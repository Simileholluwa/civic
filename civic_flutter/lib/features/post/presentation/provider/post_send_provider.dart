//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/api_client_provider.dart';
import 'package:civic_flutter/core/providers/assets_service_provider.dart';
import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_post_use_case.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';

import 'package:civic_flutter/features/post/presentation/provider/post_service_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_send_provider.g.dart';

@riverpod
class SendPost extends _$SendPost {
  @override
  Post? build() => null;

  Future<Post?> sendPostWithMedia(
    Post post,
  ) async {
    final savePost = ref.read(savePostProvider);
    final draftPost = DraftPost(
      draftId: DateTime.now().millisecondsSinceEpoch,
      postType: THelperFunctions.determinePostType(
        text: post.text,
        pickedImages: post.imageUrls,
        pickedVideo: post.videoUrl,
      ),
      text: post.text,
      imageUrls: post.imageUrls,
      videoUrl: post.videoUrl,
      taggedUsers: post.taggedUsers,
      latitude: post.latitude,
      longitude: post.latitude,
      createdAt: DateTime.now(),
    );
    final saveResult = await savePost(
      SavePostParams(
        post,
      ),
    );
    return saveResult.fold((error) async {
      log(error.message);

      final result = await ref.read(postDraftsProvider.notifier).saveDraftPost(
            draftPost,
          );
      if (result) {
        TToastMessages.errorToast(
          '${error.message}. Your post was saved to drafts.',
        );
      }
      return null;
    }, (post) {
      TToastMessages.successToast(
        'Your post was sent.',
      );
      return post;
    });
  }

  Future<List<String>?> sendMedia(
    List<String> imagePath,
    String videoPath,
    String text,
    double latitude,
    double longitude,
    List<String> taggedUsers,
  ) async {
    final isVideo = videoPath.isNotEmpty;
    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
          isVideo ? [videoPath] : imagePath,
          'posts',
          isVideo ? 'videos' : 'images',
        );
    final draftPost = DraftPost(
      draftId: DateTime.now().millisecondsSinceEpoch,
      postType: THelperFunctions.determinePostType(
        text: text,
        pickedImages: imagePath,
        pickedVideo: videoPath,
      ),
      text: text,
      imageUrls: imagePath,
      videoUrl: videoPath,
      taggedUsers: taggedUsers,
      latitude: latitude,
      longitude: latitude,
      createdAt: DateTime.now(),
    );
    return result.fold((error) async {
      log(error);

      final result = await ref.read(postDraftsProvider.notifier).saveDraftPost(
            draftPost,
          );
      if (result) {
        TToastMessages.errorToast(
          '$error. Your post was saved as draft.',
        );
      }
      return null;
    }, (mediaUrls) {
      return mediaUrls;
    });
  }

  Future<bool> sendPost({
    required String text,
    required List<String> imagePath,
    required String videoPath,
    required PostType postType,
    required double latitude,
    required double longitude,
    required List<String> taggedUsers,
  }) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final currentUser = await ref.read(clientProvider).userRecord.me();
    if (currentUser == null ||
        currentUser.userInfo == null ||
        currentUser.userInfo?.id == null) {
      TToastMessages.errorToast(
        'No user found. Please login to continue.',
      );
      return false;
    }
    if (imagePath.isNotEmpty || videoPath.isNotEmpty) {
      final isVideo = videoPath.isNotEmpty;
      final result = await sendMedia(
        imagePath,
        videoPath,
        text,
        latitude,
        longitude,
        taggedUsers,
      );
      if (result == null) {
        state = null;

        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        return false;
      }
      final postToSend = Post(
        ownerId: currentUser.userInfo!.id!,
        owner: currentUser,
        text: text,
        postType: postType,
        imageUrls: isVideo ? [] : result,
        videoUrl: isVideo ? result.first : '',
        taggedUsers: taggedUsers,
        latitude: latitude,
        longitude: longitude,
      );
      state = await sendPostWithMedia(
        postToSend,
      );
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      return true;
    } else {
      final postToSend = Post(
        ownerId: currentUser.userInfo!.id!,
        owner: currentUser,
        text: text,
        postType: postType,
        imageUrls: [],
        videoUrl: '',
        taggedUsers: taggedUsers,
        latitude: latitude,
        longitude: longitude,
      );
      state = await sendPostWithMedia(
        postToSend,
      );
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      return true;
    }
  }
}
