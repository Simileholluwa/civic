//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:convert';
import 'dart:developer';
import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'feed_provider.g.dart';

@riverpod
class Feed extends _$Feed {
  static final imageHelper = ImageHelper();
  static const int maxVideoSizeInMb = 10;

  void addUser(UserRecord userRecord) {
    if (state.taggedUsers.length < 10) {
      state = state.copyWith(
        taggedUsers: [...state.taggedUsers, userRecord],
      );
    }
  }

  void addArticleTag(String tag) {
    state = state.copyWith(
      articleTags: [...state.articleTags, tag],
    );
  }

  void setContent(String content) {
    state = state.copyWith(
      articleContent: content,
      contentPlainText: state.articleController?.document.toPlainText() ?? '',
    );
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

  void addControllers(int length) {
    if (state.controllers.length == 4) return;
    state = state.copyWith(
      controllers: [
        ...state.controllers,
        ...List.generate(
          length,
          (i) {
            return TextEditingController();
          },
        ),
      ],
    );
  }

  void addOption({required String text}) {
    if (state.optionText.length == 4) return;
    final updatedControllers = [...state.controllers, TextEditingController()];
    state = state.copyWith(
      optionText: [
        ...state.optionText,
        text,
      ],
      controllers: updatedControllers,
    );
  }

  void updateOption(int index, String option) {
    final updatedOptions = [...state.optionText];
    updatedOptions[index] = option;
    state = state.copyWith(optionText: updatedOptions);
  }

  void removeOption(int index) {
    final updatedOptions = [...state.optionText]..removeAt(index);
    final updatedControllers = [...state.controllers]..removeAt(index);
    state = state.copyWith(
      optionText: updatedOptions,
      controllers: updatedControllers,
    );
  }

  void setExpiration(DateTime expiresAt) {
    state = state.copyWith(
      expiresAt: expiresAt,
    );
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

  Future<void> takePicture([int maxImageCount = 5]) async {
    if (state.imageUrls.length >= maxImageCount) return;
    final image = await imageHelper.takeImage();
    if (image != null && state.imageUrls.length < 5) {
      if (isVideo()) {
        state = state.copyWith(videoUrl: '');
      }
      state = state.copyWith(
        imageUrls: [...state.imageUrls, image.path],
      );
    }
  }

  Future<void> pickPicture([int maxImageCount = 5]) async {
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

  String hintText(String username, bool? isCommentOrReply) {
    if (isImages()) {
      return '$username, caption your images';
    } else if (isImage()) {
      return '$username, caption your image';
    } else if (isVideo()) {
      return '$username, caption your video';
    } else if (isCommentOrReply == true) {
      return "$username, share your thoughts...";
    } else {
      return "$username, what's happening in politics? Tap here to start typing.";
    }
  }

  Future<void> savePostAsDraft(int? id, String? errorMesage) async {
    final post = Post(
      id: id,
      ownerId: ref.read(localStorageProvider).getInt('userId')!,
      text: state.text.trim(),
      imageUrls: state.imageUrls,
      videoUrl: state.videoUrl,
      taggedUsers: state.taggedUsers,
      locations: state.locations,
      mentions: ref.watch(selectedMentionsProvider),
      tags: state.tags,
    );
    final savePost = ref.read(savePostDraftProvider);
    final result = await savePost(
      SavePostDraftParams(
        post,
        'postDraft',
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

  Future<bool> sendMediaImages(int? id, bool saveDraft) async {
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
        if (saveDraft) {
          await savePostAsDraft(
            id,
            error,
          );
        }
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

  Future<void> sendPost(
    Post post,
    bool addToList,
  ) async {
    final savePost = ref.read(savePostProvider);

    final result = await savePost(
      SavePostParams(
        post,
      ),
    );
    return result.fold((error) async {
      log(error.message);
      await savePostAsDraft(
        null,
        error.message,
      );

      return;
    }, (data) async {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      if (data == null) {
        await savePostAsDraft(
          post.id,
          'Something went wrong',
        );
        return;
      }
      if (addToList) {
        ref.read(paginatedPostListProvider.notifier).addPost(
              data,
            );
      }
      TToastMessages.successToast(
        'Your post was sent.',
      );
      return;
    });
  }

  Future<void> savePostInFuture(
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
      id: postId,
      ownerId: ownerId,
      text: state.text.trim(),
      imageUrls: state.imageUrls,
      videoUrl: state.videoUrl,
      taggedUsers: state.taggedUsers,
      locations: state.locations,
      mentions: ref.watch(selectedMentionsProvider),
      tags: state.tags,
      postType: PostType.projectRepost,
      projectId: projectId,
    );
    final result = await repostQuote(
      RepostOrQuoteParams(
        projectId!,
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
      if (postId == null) {
        final postListNotifier = ref.watch(
          paginatedPostListProvider.notifier,
        );
        postListNotifier.addPost(
          post,
        );
      }
      TToastMessages.successToast(
        'Project successfully reposted',
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

    final uploadedImages = await sendMediaImages(postId, true);
    if (!uploadedImages) return;
    final uploadedVideo = await sendMediaVideo(postId);
    if (!uploadedVideo) return;
    final post = Post(
      id: postId,
      ownerId: ownerId,
      text: state.text.trim(),
      imageUrls: state.imageUrls,
      videoUrl: state.videoUrl,
      taggedUsers: state.taggedUsers,
      postType: PostType.regular,
      locations: state.locations,
      mentions: ref.watch(selectedMentionsProvider),
      tags: state.tags,
    );
    if (scheduledDateTime == null &&
        !scheduledDateTimeProvider.canSendLater()) {
      await sendPost(
        post,
        postId == null,
      );
    } else {
      await savePostInFuture(
        post,
        scheduledDateTime!,
      );
    }
    return;
  }

  Future<void> sendComment(
    int postId,
    int? id,
  ) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final ownerId = ref.read(localStorageProvider).getInt('userId')!;
    final saveComment = ref.read(savePostCommentProvider);
    final sentImages = await sendMediaImages(postId, true);
    if (!sentImages) return;
    final result = await saveComment(
      SavePostCommentParams(
        Post(
          id: id,
          ownerId: ownerId,
          text: state.text.trim(),
          imageUrls: state.imageUrls,
          locations: state.locations,
          taggedUsers: state.taggedUsers,
          mentions: ref.watch(selectedMentionsProvider),
          parentId: postId,
          subscribers: [],
        ),
        false,
      ),
    );
    result.fold((l) {
      TToastMessages.errorToast(l.message);
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
    }, (r) {
      TToastMessages.successToast('Your comment has been sent.');
      if (id == null) {
        ref
            .watch(
              paginatedCommentListProvider(postId).notifier,
            )
            .addComment(r!);
      }
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
    });
  }

  Future<void> sendReply(
    int parentId,
    int? id,
  ) async {
    ref.read(sendPostLoadingProvider.notifier).setValue(true);
    final ownerId = ref.read(localStorageProvider).getInt('userId')!;
    final saveReply = ref.read(
      savePostCommentProvider,
    );
    final sentImages = await sendMediaImages(parentId, true);
    if (!sentImages) return;
    final result = await saveReply(
      SavePostCommentParams(
        Post(
          id: id,
          ownerId: ownerId,
          text: state.text.trim(),
          imageUrls: state.imageUrls,
          locations: state.locations,
          taggedUsers: state.taggedUsers,
          mentions: ref.watch(selectedMentionsProvider),
          parentId: parentId,
          subscribers: [],
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
        if (id == null) {
          ref
              .read(paginatedRepliesListProvider(parentId).notifier)
              .addReply(r!);
        }
        ref.read(sendPostLoadingProvider.notifier).setValue(false);
      },
    );
  }

  Future<void> savePollAsDraft(int? id, String? errorMesage) async {
    List<PollOption> pollOptions =
        state.optionText.asMap().entries.map((entry) {
      final text = entry.value;
      return PollOption(
        option: text,
        pollId: 0,
      );
    }).toList();
    final poll = Poll(
      id: id,
      ownerId: ref.read(localStorageProvider).getInt('userId')!,
      options: pollOptions,
      expiresAt: state.expiresAt,
    );
    final post = Post(
      ownerId: ref.read(localStorageProvider).getInt('userId')!,
      text: state.text.trim(),
      imageUrls: state.imageUrls,
      taggedUsers: state.taggedUsers,
      locations: state.locations,
      mentions: ref.watch(selectedMentionsProvider),
      tags: state.tags,
      poll: poll,
    );

    final savePost = ref.read(savePostDraftProvider);
    final result = await savePost(
      SavePostDraftParams(
        post,
        'pollDraft',
      ),
    );
    result.fold((error) {
      log(error.message);
    }, (data) {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      errorMesage != null
          ? TToastMessages.errorToast(
              '$errorMesage. Your poll was saved to draft.',
            )
          : TToastMessages.successToast(
              'Your poll was saved to draft.',
            );
    });
  }

  Future<void> saveArticleAsDraft(int? id, String? errorMesage) async {
    final article = Article(
      id: id,
      ownerId: ref.read(localStorageProvider).getInt('userId')!,
      content: state.articleContent,
      tag: state.articleTags,
    );
    final post = Post(
      ownerId: ref.read(localStorageProvider).getInt('userId')!,
      text: state.text.trim(),
      imageUrls: state.imageUrls,
      taggedUsers: state.taggedUsers,
      locations: state.locations,
      mentions: ref.watch(selectedMentionsProvider),
      tags: state.tags,
      article: article,
    );

    final savePost = ref.read(savePostDraftProvider);
    final result = await savePost(
      SavePostDraftParams(
        post,
        'articleDraft',
      ),
    );
    result.fold((error) {
      log(error.message);
    }, (data) {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      errorMesage != null
          ? TToastMessages.errorToast(
              '$errorMesage. Your article was saved to draft.',
            )
          : TToastMessages.successToast(
              'Your article was saved to draft.',
            );
    });
  }

  Future<void> sendPoll(
    Post post,
    bool addToList,
  ) async {
    final savePoll = ref.read(savePollProvider);

    final result = await savePoll(
      SavePollParams(
        post,
      ),
    );
    return result.fold((error) async {
      log(error.message);
      await savePollAsDraft(
        null,
        error.message,
      );

      return;
    }, (data) async {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      if (data == null) {
        await savePollAsDraft(
          post.id,
          'Something went wrong',
        );
        return;
      }
      if (addToList) {
        ref.read(paginatedPollListProvider.notifier).addPoll(
              data,
            );
      }
      TToastMessages.successToast(
        'Your poll was sent.',
      );
      return;
    });
  }

  Future<void> sendAPoll(
    int? id,
    int? pollId,
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

    final uploadedImages = await sendMediaImages(postId, false);
    if (!uploadedImages) {
      await savePollAsDraft(id, 'Failed to upload images');
      return;
    }
    List<PollOption> pollOptions =
        state.optionText.asMap().entries.map((entry) {
      final text = entry.value;
      return PollOption(
        option: text,
        pollId: pollId ?? 0,
      );
    }).toList();
    final poll = Poll(
      id: pollId,
      ownerId: ownerId,
      options: pollOptions,
      expiresAt: state.expiresAt,
    );
    final post = Post(
      id: postId,
      ownerId: ownerId,
      text: state.text.trim(),
      imageUrls: state.imageUrls,
      videoUrl: state.videoUrl,
      taggedUsers: state.taggedUsers,
      postType: PostType.poll,
      locations: state.locations,
      mentions: ref.watch(selectedMentionsProvider),
      tags: state.tags,
      poll: poll,
    );

    if (scheduledDateTime == null &&
        !scheduledDateTimeProvider.canSendLater()) {
      await sendPoll(
        post,
        postId == null,
      );
    } else {
      await savePostInFuture(
        post,
        scheduledDateTime!,
      );
    }
    return;
  }

  Future<void> sendMediaAndModifyContent(
    int? id,
    List<String> embeddedImages,
    String content,
  ) async {
    final result = await ref.read(assetServiceProvider).uploadMediaAssets(
          embeddedImages,
          'articles',
          'images',
        );

    return result.fold((error) async {
      log(error);
      await saveArticleAsDraft(
        id,
        error,
      );

      return;
    }, (mediaUrls) {
      final pathReplacements = FeedHelperFunctions.mapEmbededImages(
        embeddedImages,
        mediaUrls,
      );
      final modifiedContent = FeedHelperFunctions.modifyArticleContent(
        content,
        pathReplacements,
      );

      setContent(modifiedContent);
      return;
    });
  }

  Future<void> sendArticle(
    Post post,
    bool addToList,
  ) async {
    final saveArticle = ref.read(saveArticleProvider);

    final result = await saveArticle(
      SaveArticleParams(
        post,
      ),
    );
    return result.fold((error) async {
      log(error.message);
      await saveArticleAsDraft(
        null,
        error.message,
      );

      return;
    }, (data) async {
      ref.read(sendPostLoadingProvider.notifier).setValue(false);
      if (data == null) {
        await saveArticleAsDraft(
          post.id,
          'Something went wrong',
        );
        return;
      }
      if (addToList) {
        ref.read(paginatedArticleListProvider.notifier).addArticle(
              data,
            );
      }
      TToastMessages.successToast(
        'Your article was sent.',
      );
      return;
    });
  }

  Future<void> sendAnArticle(
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

    final uploadedImages = await sendMediaImages(postId, false);
    if (!uploadedImages) {
      await saveArticleAsDraft(id, 'Failed to upload banner');
      return;
    }
    final embeddedImages = FeedHelperFunctions.getAllImagesFromEditor(
      state.articleContent,
    );
    if (embeddedImages.isNotEmpty) {
      await sendMediaAndModifyContent(
        postId,
        embeddedImages,
        state.articleContent,
      );
    }

    final article = Article(
      ownerId: ownerId,
      content: state.articleContent,
      tag: state.articleTags,
    );

    final post = Post(
      id: postId,
      ownerId: ownerId,
      text: state.text.trim(),
      imageUrls: state.imageUrls,
      taggedUsers: state.taggedUsers,
      locations: state.locations,
      mentions: state.mentions,
      tags: state.tags,
      article: article,
      postType: PostType.article,
    );

    if (scheduledDateTime == null &&
        !scheduledDateTimeProvider.canSendLater()) {
      await sendArticle(
        post,
        postId == null,
      );
    } else {
      await savePostInFuture(
        post,
        scheduledDateTime!,
      );
    }
    return;
  }

  @override
  FeedState build(Post? post) {
    ref.onDispose(() {
      state.controller.dispose();
      state.articleController?.dispose();
      state.focusNode?.dispose();
      state.scrollController?.dispose();
      for (var ctr in state.controllers) {
        ctr.dispose();
      }
    });
    if (post == null) {
      final feedState = FeedState.empty();
      feedState.controller.addListener(
        () {
          setText(feedState.controller.text);
        },
      );

      return feedState;
    } else {
      final feedState = FeedState.populate(post);
      feedState.controller.addListener(() {
        setText(feedState.controller.text);
      });

      if (post.article != null) {
        if (post.article!.content != null) {
          feedState.articleController!.addListener(() {
            setContent(
              jsonEncode(
                feedState.articleController!.document.toDelta().toJson(),
              ),
            );
          });
        }
      }

      if (post.videoUrl != null) {
        if (post.videoUrl!.isNotEmpty) {
          ref.read(
            mediaVideoPlayerProvider(
              feedState.videoUrl,
            ),
          );
        }
      }
      return feedState;
    }
  }
}
