//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/helpers/helper_functions.dart';
import 'package:civic_flutter/core/providers/assets_service_provider.dart';
import 'package:civic_flutter/core/providers/boolean_providers.dart';
import 'package:civic_flutter/core/providers/scheduled_datetime_provider.dart';
import 'package:civic_flutter/core/toasts_messages/toast_messages.dart';
import 'package:civic_flutter/core/usecases/usecase.dart';
import 'package:civic_flutter/features/post/domain/usecases/schedule_post_use_case.dart';
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
    Post post,
    String errorMessage,
  ) async {
    final draftPost = DraftPost(
      postType: THelperFunctions.determinePostType(
        text: post.text,
        pickedImages: post.imageUrls,
        pickedVideo: post.videoUrl,
      ),
      text: post.text,
      imagesPath: post.imageUrls,
      videoPath: post.videoUrl,
      taggedUsers: post.taggedUsers,
      locations: post.locations,
      mentions: post.mentions,
      tags: post.tags,
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

  Future<List<String>> sendMediaImages(Post post) async {
    var existingUpload = <String>[];
    var newUpload = <String>[];
    if (post.imageUrls.isNotEmpty) {
      for (final image in post.imageUrls) {
        final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
        if (regex.hasMatch(image)) {
          existingUpload.add(image);
        } else {
          newUpload.add(image);
        }
      }
      final result = await ref.read(assetServiceProvider).uploadMediaAssets(
            newUpload,
            'posts',
            'images',
          );

      return result.fold((error) async {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        log(error);
        await saveFailedPostAsDraft(
          post,
          error,
        );

        return [];
      }, (mediaUrls) {
        return mediaUrls + existingUpload;
      });
    }
    return [];
  }

  Future<String> sendMediaVideo(Post post) async {
    if (post.videoUrl.isNotEmpty) {
      final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
      if (regex.hasMatch(post.videoUrl)) {
        return post.videoUrl;
      }
      final result = await ref.read(assetServiceProvider).uploadMediaAssets(
        [post.videoUrl],
        'posts',
        'videos',
      );

      return result.fold((error) async {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        log(error);
        await saveFailedPostAsDraft(
          post,
          error,
        );

        return '';
      }, (videoUrl) {
        return videoUrl.first;
      });
    }
    return '';
  }

  Future<Post?> sendPost(
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
      await saveFailedPostAsDraft(
        post,
        error.message,
      );

      return null;
    }, (data) async {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      if (data == null) {
        await saveFailedPostAsDraft(
          post,
          'Something went wrong',
        );
        return null;
      }
      TToastMessages.successToast(
        'Your post was sent.',
      );
      return post;
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
      SchedulePostParams(post, dateTime),
    );
    return result.fold(
      (error) async {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        await saveFailedPostAsDraft(
          post,
          error.message,
        );
      },
      (r) {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        TToastMessages.successToast(
          'Your post will be sent on ${scheduledDateTimeProvider.humanizeDateTimeForSend()}',
        );
      },
    );
  }

  Future<void> send({
    required Post post,
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
          post,
          error.message,
        );
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        return;
      },
      (record) async {
        final scheduledDateTime = ref.watch(postScheduledDateTimeProvider);
        final scheduledDateTimeProvider = ref.read(
          postScheduledDateTimeProvider.notifier,
        );
        final uploadedImages = await sendMediaImages(post);
        final uploadedVideo = await sendMediaVideo(post);
        final postTosend = post.copyWith(
          imageUrls: uploadedImages,
          videoUrl: uploadedVideo,
          owner: record,
        );
        if (scheduledDateTime == null) {
          await sendPost(
            postTosend,
          );
        } else {
          if (scheduledDateTimeProvider.canSendLater()) {
            await saveInFuture(
              postTosend,
              scheduledDateTime,
            );
          } else {
            await sendPost(
              postTosend,
            );
          }
        }
        return;
      },
    );
  }
}
