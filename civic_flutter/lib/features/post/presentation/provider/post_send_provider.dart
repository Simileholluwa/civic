//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/assets_service_provider.dart';
import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:civic_flutter/core/providers/scheduled_datetime_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_in_future_use_case.dart';
import 'package:civic_flutter/features/post/domain/usecases/save_post_use_case.dart';
import 'package:civic_flutter/features/post/presentation/provider/post_draft_provider.dart';

import 'package:civic_flutter/features/post/presentation/provider/post_service_provider.dart';
import 'package:civic_flutter/features/profile/presentation/provider/profile_provider.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_send_provider.g.dart';

@riverpod
class SendPost extends _$SendPost {
  @override
  void build() {}

  Future<void> saveFailedPostAsDraft(
    List<String> imagePath,
    String videoPath,
    String text,
    List<AWSPlaces> locations,
    List<UserRecord> taggedUsers,
    String errorMessage,
  ) async {
    final draftPost = DraftPost(
      postType: THelperFunctions.determinePostType(
        text: text,
        pickedImages: imagePath,
        pickedVideo: videoPath,
      ),
      text: text,
      imagesPath: imagePath,
      videoPath: videoPath,
      taggedUsers: taggedUsers,
      locations: locations,
    );
    final draftPostProvider = ref.read(postDraftsProvider.notifier);
    final result = await draftPostProvider.saveDraftPost(
      draftPost,
    );
    if (result) {
      TToastMessages.errorToast(
        '$errorMessage. Your post was saved to drafts.',
      );
    }
  }

  Future<Post?> sendPostWithMedia(
    Post post,
  ) async {
    final savePost = ref.read(savePostProvider);

    final saveResult = await savePost(
      SavePostParams(
        post,
      ),
    );
    return saveResult.fold((error) async {
      log(error.message);
      await saveFailedPostAsDraft(post.imageUrls, post.videoUrl, post.text,
          post.locations, post.taggedUsers, error.message);
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
    List<AWSPlaces> locations,
    List<UserRecord> taggedUsers,
  ) async {
    final isVideo = videoPath.isNotEmpty;
    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
          isVideo ? [videoPath] : imagePath,
          'posts',
          isVideo ? 'videos' : 'images',
        );

    return result.fold((error) async {
      log(error);
      await saveFailedPostAsDraft(
        imagePath,
        videoPath,
        text,
        locations,
        taggedUsers,
        error,
      );

      return null;
    }, (mediaUrls) {
      return mediaUrls;
    });
  }

  Future<void> saveInFuture(
    Post post,
    DateTime dateTime,
  ) async {
    final saveInFuture = ref.read(saveInFutureProvider);
    final scheduledDateTimeProvider = ref.read(
      postScheduledDateTimeProvider.notifier,
    );
    final result = await saveInFuture(
      SaveInFutureParams(post, dateTime),
    );
    return result.fold(
      (error) async {
        await saveFailedPostAsDraft(
          post.imageUrls,
          post.videoUrl,
          post.text,
          post.locations,
          post.taggedUsers,
          error.message,
        );
      },
      (r) {
        TToastMessages.successToast(
          'Your post will be sent on ${scheduledDateTimeProvider.humanizeDateTimeForSend()}',
        );
      },
    );
  }

  Future<bool> sendPost({
    required String text,
    required List<String> imagePath,
    required String videoPath,
    required PostType postType,
    required List<AWSPlaces> locations,
    required List<UserRecord> taggedUsers,
  }) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final me = ref.read(meUseCaseProvider);
    final userRecord = await me(NoParams());

    return userRecord.fold(
      (error) async {
        log(error.message);
        TToastMessages.errorToast(
          error.message,
        );
        await saveFailedPostAsDraft(
          imagePath,
          videoPath,
          text,
          locations,
          taggedUsers,
          error.message,
        );
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        return false;
      },
      (record) async {
        final scheduledDateTime = ref.watch(postScheduledDateTimeProvider);
        final scheduledDateTimeProvider = ref.read(
          postScheduledDateTimeProvider.notifier,
        );
        if (imagePath.isNotEmpty || videoPath.isNotEmpty) {
          final isVideo = videoPath.isNotEmpty;
          final result = await sendMedia(
            imagePath,
            videoPath,
            text,
            locations,
            taggedUsers,
          );
          if (result == null) {
            state = null;

            ref.read(sendPostLoadingProvider.notifier).setValue(false);
            return false;
          }
          final postToSend = Post(
            ownerId: record.id!,
            text: text,
            postType: postType,
            imageUrls: isVideo ? [] : result,
            videoUrl: isVideo ? result.first : '',
            taggedUsers: taggedUsers,
            locations: locations,
          );
          scheduledDateTime == null
              ? await sendPostWithMedia(
                  postToSend,
                )
              : scheduledDateTimeProvider.canSendLater()
                  ? await saveInFuture(
                      postToSend,
                      scheduledDateTime,
                    )
                  : await sendPostWithMedia(
                      postToSend,
                    );
          ref.read(sendPostLoadingProvider.notifier).setValue(false);
          return true;
        } else {
          final postToSend = Post(
            ownerId: record.userInfo!.id!,
            text: text,
            postType: postType,
            imageUrls: [],
            videoUrl: '',
            taggedUsers: taggedUsers,
            locations: locations,
          );
          scheduledDateTime == null
              ? await sendPostWithMedia(
                  postToSend,
                )
              : scheduledDateTimeProvider.canSendLater()
                  ? await saveInFuture(
                      postToSend,
                      scheduledDateTime,
                    )
                  : await sendPostWithMedia(
                      postToSend,
                    );
          ref.read(sendPostLoadingProvider.notifier).setValue(false);
          return true;
        }
      },
    );
  }
}
