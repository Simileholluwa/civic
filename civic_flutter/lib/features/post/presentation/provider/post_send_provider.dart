//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/providers/assets_service_provider.dart';
import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_post_use_case.dart';

import 'package:civic_flutter/features/post/presentation/provider/post_service_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_send_provider.g.dart';

@riverpod
class SendPost extends _$SendPost {
  @override
  Post? build() => null;

  Future<Post?> sendPostWithMedia(Post post) async {
    final savePost = ref.read(savePostProvider);
    final saveResult = await savePost(
      SavePostParams(
        post,
      ),
    );
    return saveResult.fold((error) {
      log(error.message);
      TToastMessages.errorToast(
        error.message,
      );
      return null;
    }, (post) {
      TToastMessages.successToast(
        'Your post was sent.',
      );
      return post;
    });
  }

  Future<List<String>?> sendMedia(
    Post post,
  ) async {
    final isVideo = post.videoUrl.isNotEmpty;
    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
          isVideo ? [post.videoUrl] : post.imageUrls,
          'posts',
          isVideo ? 'videos' : 'images',
        );
    return result.fold((error) {
      log(error);
      return null;
    }, (mediaUrls) {
      return mediaUrls;
    });
  }

  Future<void> sendPost(
    Post post,
  ) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    if (post.imageUrls.isNotEmpty || post.videoUrl.isNotEmpty) {
      final isVideo = post.videoUrl.isNotEmpty;
      final result = await sendMedia(post);
      if (result == null) {
        state = null;
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        return;
      }
      final postToSend = Post(
        ownerId: post.ownerId,
        text: post.text,
        postType: post.postType,
        imageUrls: isVideo ? [] : result,
        videoUrl: isVideo ? result.first : '',
        taggedUsers: post.taggedUsers,
        latitude: post.latitude,
        longitude: post.longitude,
      );
      state = await sendPostWithMedia(
        postToSend,
      );

      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      return;
    } else {
      state = await sendPostWithMedia(
        post,
      );
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      return;
    }
  }
}
