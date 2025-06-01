//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/post/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_provider.g.dart';

@riverpod
class RegularPost extends _$RegularPost {
  static final imageHelper = ImageHelper();
  static const int maxImageCount = 10;
  static const int maxVideoSizeInMb = 10;

  void addUser(UserRecord userRecord) {
    if (state.taggedUsers.length < 10) {
      state = state.copyWith(
        taggedUsers: [...state.taggedUsers, userRecord],
      );
    }
  }

  void removeUser(UserRecord userRecord) {
    state = state.copyWith(
      taggedUsers: state.taggedUsers
          .where((record) => record.userInfo!.id != userRecord.userInfo!.id)
          .toList(),
    );
  }

  void clearSelections() {
    state = state.copyWith(
      taggedUsers: <UserRecord>[],
    );
  }

  void addLocation(List<AWSPlaces> locations) {
    state = state.copyWith(locations: [...state.locations, ...locations]);
  }

  void removeLocation(AWSPlaces location) {
    state = state.copyWith(
      locations:
          state.locations.where((loc) => loc.place != location.place).toList(),
    );
  }

  void removeAllLocations() {
    state = state.copyWith(locations: []);
  }

  void setText(String text) {
    state = state.copyWith(text: text);
  }

  void setImages(List<String> images) {
    state = state = state.copyWith(imageUrls: images);
  }

  void setVideo(String video) {
    state = state.copyWith(videoUrl: video);
    ref.read(mediaVideoPlayerProvider(state.videoUrl));
  }

  Future<void> takeVideo() async {
    final imageHelper = ImageHelper();
    final video = await imageHelper.takeVideo();
    if (video != null) {
      setVideo(video.path);
      setImages([]);
    }
  }

  Future<void> pickVideo() async {
    final imageHelper = ImageHelper();
    final video = await imageHelper.pickVideo();
    if (video != null) {
      final fileSizeInBytes = await video.length();
      final fileSizeInMB = fileSizeInBytes ~/ (1024 * 1024);
      if (fileSizeInMB > 20) {
        TToastMessages.infoToast(
          'File size must be less than 20MB.',
        );
        return;
      }
      setVideo(video.path);
      setImages([]);
    }
  }

  Future<void> takePicture() async {
    if (state.imageUrls.length >= maxImageCount) return;
    final image = await imageHelper.takeImage();
    if (image != null && state.imageUrls.length < 10) {
      if (isVideo()) {
        state = state.copyWith(videoUrl: '');
      }
      state = state.copyWith(
        imageUrls: [...state.imageUrls, image.path],
      );
    }
  }

  Future<void> pickPicture() async {
    if (state.imageUrls.length >= maxImageCount) return;
    final imageLength = maxImageCount - state.imageUrls.length;
    final image = await imageHelper.pickImage(
      multipleImages: imageLength > 1 ? true : false,
    );
    if (image != null) {
      if (isVideo()) {
        state = state.copyWith(videoUrl: '');
      }
      var imagePaths = <String>[];
      for (final img in image) {
        imagePaths.add(img.path);
      }
      state = state.copyWith(
        imageUrls: [
          ...state.imageUrls,
          ...imagePaths.take(imageLength),
        ],
      );
      if (image.length > imageLength) {
        TToastMessages.infoToast(
          'A maximum of 10 images can be uploaded.',
        );
      }
    }
  }

  void removeImageAtIndex(index) {
    var images = state.imageUrls;
    if (images.length == 1) {
      state = state.copyWith(
        imageUrls: [],
      );
    }
    images.removeAt(index);
    state = state.copyWith(
      imageUrls: [...images],
    );
  }

  bool isImage() {
    if (state.imageUrls.isNotEmpty && state.imageUrls.length == 1) {
      return true;
    }
    return false;
  }

  bool isImages() {
    if (state.imageUrls.isNotEmpty && state.imageUrls.length > 1) {
      return true;
    }
    return false;
  }

  bool isVideo() {
    if (state.videoUrl.isNotEmpty && THelperFunctions.isVideo(state.videoUrl)) {
      return true;
    }
    return false;
  }

  void clearMedia() {
    state = state.copyWith(imageUrls: []);
    state = state.copyWith(videoUrl: '');
  }

  String hintText(String username) {
    if (isImages()) {
      return '$username, caption your images';
    } else if (isImage()) {
      return '$username, caption your image';
    } else if (isVideo()) {
      return '$username, caption your video';
    } else {
      return "$username, what's happening in politics? Tap here to start typing.";
    }
  }

  Future<void> savePostAsDraft(int? id, String? errorMesage) async {
    final post = Post(
      id: id,
      ownerId: ref.read(localStorageProvider).getInt('userId')!,
      text: state.text,
      imageUrls: state.imageUrls,
      videoUrl: state.videoUrl,
      taggedUsers: state.taggedUsers,
      locations: state.locations,
      mentions: state.mentions,
      tags: state.tags,
    );
    final savePost = ref.read(savePostDraftProvider);
    final result = await savePost(
      SavePostDraftParams(
        post,
      ),
    );
    result.fold((error) {
      log(error.message);
    }, (data) {
      errorMesage != null
          ? TToastMessages.errorToast(
              '$errorMesage. Your post was saved to draft.',
            )
          : TToastMessages.successToast(
              'Your post was saved to draft.',
            );
    });
  }

  Future<bool> sendMediaImages(int? id) async {
    var existingUpload = <String>[];
    var newUpload = <String>[];
    if (state.imageUrls.isNotEmpty) {
      for (final image in state.imageUrls) {
        final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
        if (regex.hasMatch(image)) {
          existingUpload.add(image);
        } else {
          newUpload.add(image);
        }
      }
      if (newUpload.isEmpty) return true;
      final result = await ref.read(assetServiceProvider).uploadMediaAssets(
            newUpload,
            'posts',
            'images',
          );

      return result.fold((error) async {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        log(error);
        await savePostAsDraft(
          id,
          error,
        );
        return false;
      }, (mediaUrls) {
        state = state.copyWith(
          imageUrls: [...existingUpload, ...mediaUrls],
        );
        return true;
      });
    } else {
      return true;
    }
  }

  Future<bool> sendMediaVideo(int? id) async {
    if (state.videoUrl.isNotEmpty) {
      final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
      if (regex.hasMatch(state.videoUrl)) return true;

      final result = await ref.read(assetServiceProvider).uploadMediaAssets(
        [state.videoUrl],
        'posts',
        'videos',
      );

      return result.fold((error) async {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        log(error);
        await savePostAsDraft(
          id,
          error,
        );

        return false;
      }, (videoUrl) {
        state = state.copyWith(
          videoUrl: videoUrl.first,
        );
        return true;
      });
    } else {
      return true;
    }
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
      await savePostAsDraft(
        null,
        error.message,
      );

      return null;
    }, (data) async {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      if (data == null) {
        await savePostAsDraft(
          post.id,
          'Something went wrong',
        );
        return null;
      }
      ref.read(paginatedPostListProvider.notifier).addPost(
            data,
          );
      TToastMessages.successToast(
        'Your post was sent.',
      );
      return data;
    });
  }

  Future<void> saveInFuture(
    Post post,
    DateTime dateTime,
  ) async {
    final saveInFuture = ref.read(schedulePostProvider);
    final scheduledDateTimeProvider = ref.read(
      postScheduledDateTimeProvider.notifier,
    );
    final result = await saveInFuture(
      SchedulePostParams(post, dateTime),
    );
    return result.fold(
      (error) async {
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
        await savePostAsDraft(
          post.id,
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

  Future<void> repostOrQuote(
    int? postId,
    int? projectId,
  ) async {
    final repostQuote = ref.read(repostOrQuotePostProvider);
    final ownerId = ref.read(localStorageProvider).getInt('userId')!;
    final quoteContent = Post(
      ownerId: ownerId,
      text: state.text,
      imageUrls: state.imageUrls,
      videoUrl: state.videoUrl,
      taggedUsers: state.taggedUsers,
      locations: state.locations,
      mentions: state.mentions,
      tags: state.tags,
    );
    final result = await repostQuote(
      RepostOrQuoteParams(
        projectId,
        quoteContent,
      ),
    );
    return result.fold((error) async {
      log('Error: ${error.message}');
      error.action == 'deleted'
          ? TToastMessages.successToast(
              error.message,
            )
          : TToastMessages.errorToast(
              error.message,
            );
      return;
    }, (post) {
      final postListNotifier = ref.watch(
        paginatedPostListProvider.notifier,
      );
      postListNotifier.addPost(
        post,
      );
      TToastMessages.successToast(
        projectId != null
            ? 'Project successfully reposted'
            : 'Post successfully reposted',
      );

      return;
    });
  }

  Future<void> send(
    int? id,
  ) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final scheduledDateTime = ref.watch(postScheduledDateTimeProvider);
    final scheduledDateTimeProvider = ref.read(
      postScheduledDateTimeProvider.notifier,
    );

    final ownerId = ref.read(localStorageProvider).getInt('userId')!;
    int? postId;
    if (id != null) {
      if (id == 0) {
        postId = null;
      } else {
        postId = id;
      }
    }

    final uploadedImages = await sendMediaImages(postId);
    if (!uploadedImages) return;
    final uploadedVideo = await sendMediaVideo(postId);
    if (!uploadedVideo) return;
    final post = Post(
      id: postId,
      ownerId: ownerId,
      text: state.text,
      imageUrls: state.imageUrls,
      videoUrl: state.videoUrl,
      taggedUsers: state.taggedUsers,
      postType: PostType.regular,
      locations: state.locations,
      mentions: state.mentions,
      tags: state.tags,
    );
    if (scheduledDateTime == null &&
        !scheduledDateTimeProvider.canSendLater()) {
      await sendPost(
        post,
      );
    } else {
      await saveInFuture(
        post,
        scheduledDateTime!,
      );
    }
    return;
  }

  Future<void> sendComment(int postId) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final ownerId = ref.read(localStorageProvider).getInt('userId')!;
    final saveComment = ref.read(savePostCommentProvider);
    final sentImages = await sendMediaImages(postId);
    if (!sentImages) return;
    final result = await saveComment(
      SavePostCommentParams(
        Post(
          ownerId: ownerId,
          text: state.text,
          imageUrls: state.imageUrls,
          locations: state.locations,
          taggedUsers: state.taggedUsers,
          parentId: postId,
        ),
        false,
      ),
    );
    result.fold((l) {
      TToastMessages.errorToast(l.message);
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
    }, (r) {
      TToastMessages.successToast('Your comment has been sent.');
      ref.watch(
        paginatedPostCommentListProvider(postId).notifier,
      ).addComment(r!);
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
    });
  }

  Future<void> sendReply(
    int parentId,
  ) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final ownerId = ref.read(localStorageProvider).getInt('userId')!;
    final saveReply = ref.read(
      savePostCommentProvider,
    );
    final sentImages = await sendMediaImages(parentId);
    if (!sentImages) return;
    final result = await saveReply(
      SavePostCommentParams(
        Post(
          ownerId: ownerId,
          text: state.text,
          imageUrls: state.imageUrls,
          locations: state.locations,
          taggedUsers: state.taggedUsers,
          parentId: parentId,
        ),
        true,
      ),
    );
    result.fold(
      (l) {
        TToastMessages.errorToast(l.message);
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
      },
      (r) {
        TToastMessages.successToast('Your reply has been sent.');
        ref
            .read(paginatedPostCommentRepliesListProvider(parentId).notifier)
            .addReply(r!);
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
      },
    );
  }

  @override
  PostState build(Post? post) {
    if (post == null) {
      final postState = PostState.empty();
      postState.controller.addListener(
        () {
          setText(postState.controller.text);
        },
      );
      return postState;
    } else {
      final postState = PostState.populate(post);
      postState.controller.addListener(() {
        setText(postState.controller.text);
      });

      if (post.videoUrl != null) {
        if (post.videoUrl!.isNotEmpty) {
          ref.read(
            mediaVideoPlayerProvider(
              postState.videoUrl,
            ),
          );
        }
      }
      return postState;
    }
  }
}
