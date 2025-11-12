import 'dart:convert';

import 'package:civic_client/civic_client.dart';
import 'package:civic_flutter/core/core.dart';
import 'package:civic_flutter/features/create/create.dart';
import 'package:civic_flutter/features/feed/feed.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'post_creation_provider.g.dart';

@riverpod
class PostCreation extends _$PostCreation {
  static final imageHelper = ImageHelper();
  static const int maxVideoSizeInMb = 10;
  static final RegExp _urlRegex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');

  // Track the current draft id to avoid creating duplicate drafts when
  // saving the same draft multiple times.
  int? _currentDraftId;

  int get _ownerId => ref.read(localStorageProvider).getInt('userId')!;

  // Keep the provider alive during async send operations to avoid disposal mid-flight.
  Future<T> _withKeepAlive<T>(Future<T> Function() action) async {
    final link = ref.keepAlive();
    try {
      return await action();
    } finally {
      link.close();
    }
  }

  // Retry helper with exponential backoff; retries on thrown exceptions.
  Future<void> _retryWithBackoff(
    Future<void> Function() action, {
    int maxAttempts = 3,
    Duration initialDelay = const Duration(milliseconds: 700),
  }) async {
    var attempt = 0;
    var delay = initialDelay;
    while (true) {
      try {
        await action();
        return;
      } catch (e) {
        attempt++;
        if (attempt >= maxAttempts) rethrow;
        await Future<void>.delayed(delay);
        delay *= 2;
      }
    }
  }

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
    state = state.copyWith(imageUrls: images);
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
    final video = await PostCreation.imageHelper.takeVideo();
    if (video != null) {
      setVideo(video.path);
      setImages([]);
    }
  }

  Future<void> pickVideo() async {
    final video = await PostCreation.imageHelper.pickVideo();
    if (video != null) {
      final fileSizeInBytes = await video.length();
      final fileSizeInMB = fileSizeInBytes ~/ (1024 * 1024);
      if (fileSizeInMB > maxVideoSizeInMb) {
        TToastMessages.infoToast(
          'File size must be less than $maxVideoSizeInMb MB.',
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

  Future<void> pickPicture([int maxImageCount = 10]) async {
    if (state.imageUrls.length >= maxImageCount) return;
    final imageLength = maxImageCount - state.imageUrls.length;
    final image = await imageHelper.pickImage(
      multipleImages: imageLength > 1,
    );
    if (image != null) {
      if (isVideo()) {
        state = state.copyWith(videoUrl: '');
      }
      final imagePaths = <String>[];
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
          'A maximum of $maxImageCount images can be uploaded.',
        );
      }
    }
  }

  void removeImageAtIndex(int index) {
    final images = List<String>.from(state.imageUrls);
    if (index < 0 || index >= images.length) return;
    images.removeAt(index);
    state = state.copyWith(imageUrls: images);
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

  /// Load the editor state from a draft [Post].
  /// Disposes existing controllers/nodes, re-populates state, reattaches listeners,
  /// restores mentions and initializes media players where needed.
  void loadFromDraft(Post draft) {
    // Dispose old controllers and focus/scroll nodes to avoid leaked listeners.
    try {
      state.controller.dispose();
    } on Exception catch (_) {}
    try {
      state.articleController?.dispose();
    } on Exception catch (_) {}
    try {
      state.focusNode?.dispose();
    } on Exception catch (_) {}
    try {
      state.scrollController?.dispose();
    } on Exception catch (_) {}

    // Restore selected mentions from draft
    final draftMentions = draft.mentions ?? <UserRecord>[];
    ref.read(selectedMentionsProvider.notifier).setMentions = draftMentions;

    // Build fresh state from draft
    var next = PostCreationState.populate(draft);

    // If draft contains a poll, normalize options to 2..5 and rebuild controllers.
    if (draft.poll?.options != null) {
      final raw = draft.poll!.options
              ?.map((o) => o.option ?? '')
              .toList(growable: true) ??
          <String>[];
      // Ensure between 2 and 5 options
      if (raw.length < 2) {
        raw.addAll(List.filled(2 - raw.length, ''));
      } else if (raw.length > 5) {
        raw.removeRange(5, raw.length);
      }
      final optControllers = List<TextEditingController>.generate(
        raw.length,
        (i) => TextEditingController(
          text: raw[i],
        ),
      );
      next = next.copyWith(
        optionText: raw,
        controllers: optControllers,
      );
    }

    // Attach listeners to keep state in sync with user edits
    next.controller.addListener(() {
      if (!ref.mounted) return;
      setText(next.controller.text);
    });

    if (draft.article?.content != null) {
      next.articleController?.addListener(
        () {
          if (!ref.mounted) return;
          setContent(
            jsonEncode(
              next.articleController!.document.toDelta().toJson(),
            ),
          );
        },
      );
    }

    // Initialize video player if applicable
    if ((draft.videoUrl ?? '').isNotEmpty) {
      ref.read(mediaVideoPlayerProvider(next.videoUrl));
    }

    // Commit new state
    state = next;

    // Remember current draft id so subsequent saves update, not create new
    _currentDraftId = draft.id;
  }

  String hintText(String username, bool? isCommentOrReply) {
    if (isImages()) {
      return '$username, caption your images';
    } else if (isImage()) {
      return '$username, caption your image';
    } else if (isVideo()) {
      return '$username, caption your video';
    } else if (isCommentOrReply ?? false) {
      return '$username, share your thoughts...';
    } else {
      return "$username, what's happening in politics? Tap here "
          'to start typing.';
    }
  }

  Future<void> savePostAsDraft(
    int? id,
    String? errorMesage,
  ) async {
    // Reuse previous draft id if present, else use provided id, else new id
    final effectiveId =
        _currentDraftId ?? id ?? DateTime.now().millisecondsSinceEpoch;
    _currentDraftId = effectiveId;
    final post = PostBuilder.buildPost(
      id: effectiveId,
      ownerId: _ownerId,
      state: state,
      mentions: ref.watch(selectedMentionsProvider),
    );
    final saveDraft = ref.read(savePostDraftProvider);
    final result = await saveDraft(
      SaveOrUpdatePostDraftParams(
        post: post,
        draftType: TTexts.postDraft,
      ),
    );
    result.fold((error) {
      TToastMessages.errorToast(error.message);
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
    final existingUpload = <String>[];
    final newUpload = <String>[];
    if (state.imageUrls.isNotEmpty) {
      for (final image in state.imageUrls) {
        if (_urlRegex.hasMatch(image)) {
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
        ref.read(sendPostLoadingProvider.notifier).value = false;
        TToastMessages.errorToast(error);
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
      if (_urlRegex.hasMatch(state.videoUrl)) return true;

      final result = await ref.read(assetServiceProvider).uploadMediaAssets(
        [state.videoUrl],
        'posts',
        'videos',
      );

      return result.fold((error) async {
        ref.read(sendPostLoadingProvider.notifier).value = false;
        TToastMessages.errorToast(error);
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
    return _withKeepAlive(() async {
      final savePost = ref.read(savePostProvider);

      final result = await savePost(
        SavePostParams(
          post,
        ),
      );
      return result.fold((error) async {
        TToastMessages.errorToast(error.message);
        await savePostAsDraft(
          null,
          error.message,
        );

        return;
      }, (data) async {
        ref.read(sendPostLoadingProvider.notifier).value = false;
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
    });
  }

  Future<void> savePostInFuture(
    Post post,
    DateTime dateTime,
  ) async {
    return _withKeepAlive(() async {
      final saveInFuture = ref.read(schedulePostProvider);
      final scheduledDateTimeProvider = ref.read(
        postScheduledDateTimeProvider.notifier,
      );
      final result = await saveInFuture(
        SchedulePostParams(post, dateTime),
      );
      return result.fold(
        (error) async {
          ref.read(sendPostLoadingProvider.notifier).value = false;
          await savePostAsDraft(
            post.id,
            error.message,
          );
        },
        (r) {
          ref.read(sendPostLoadingProvider.notifier).value = false;
          TToastMessages.successToast(
            'Your post will be sent on'
            ' ${scheduledDateTimeProvider.humanizeDateTimeForSend()}',
          );
        },
      );
    });
  }

  Future<void> repostOrQuote(
    int? postId,
    int? projectId,
  ) async {
    return _withKeepAlive(() async {
      final repostQuote = ref.read(repostOrQuotePostProvider);
      final ownerId = _ownerId;
      final quoteContent = PostBuilder.buildPost(
        id: postId,
        ownerId: ownerId,
        state: state,
        mentions: ref.watch(selectedMentionsProvider),
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
          ref
              .watch(
                paginatedPostListProvider.notifier,
              )
              .addPost(
                post,
              );
        }
        TToastMessages.successToast(
          'Project successfully reposted',
        );

        return;
      });
    });
  }

  Future<void> send(
    int? id,
  ) async {
    return _withKeepAlive(() async {
      ref.read(sendPostLoadingProvider.notifier).value = true;
      final scheduledDateTime = ref.watch(postScheduledDateTimeProvider);
      final scheduledDateTimeProvider = ref.read(
        postScheduledDateTimeProvider.notifier,
      );

      final ownerId = _ownerId;
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
      final post = PostBuilder.buildPost(
        id: postId,
        ownerId: ownerId,
        state: state,
        mentions: ref.watch(selectedMentionsProvider),
        postType: PostType.regular,
      );
      await _retryWithBackoff(() async {
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
      });
      return;
    });
  }

  Future<void> sendComment(
    int postId,
    int? id,
  ) async {
    return _withKeepAlive(() async {
      ref.read(sendPostLoadingProvider.notifier).value = true;
      final ownerId = _ownerId;
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
          ),
          false,
        ),
      );
      result.fold((l) {
        TToastMessages.errorToast(l.message);
        ref.read(sendPostLoadingProvider.notifier).value = false;
      }, (r) {
        TToastMessages.successToast('Your comment has been sent.');
        if (id == null) {
          ref
              .watch(
                paginatedCommentListProvider(postId).notifier,
              )
              .addComment(r!);
        }
        ref.read(sendPostLoadingProvider.notifier).value = false;
      });
    });
  }

  Future<void> sendReply(
    int parentId,
    int? id,
  ) async {
    return _withKeepAlive(() async {
      ref.read(sendPostLoadingProvider.notifier).value = true;
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
          ),
          true,
        ),
      );
      result.fold(
        (l) {
          TToastMessages.errorToast(l.message);
          ref.read(sendPostLoadingProvider.notifier).value = false;
        },
        (r) {
          TToastMessages.successToast('Your reply has been sent.');
          if (id == null) {
            ref
                .read(paginatedRepliesListProvider(parentId).notifier)
                .addReply(r!);
          }
          ref.read(sendPostLoadingProvider.notifier).value = false;
        },
      );
    });
  }

  Future<void> savePollAsDraft(int? id, String? errorMesage) async {
    final effectiveId =
        _currentDraftId ?? id ?? DateTime.now().millisecondsSinceEpoch;
    _currentDraftId = effectiveId;
    final poll = PostBuilder.buildPoll(
      id: effectiveId,
      ownerId: _ownerId,
      state: state,
    );
    final post = PostBuilder.buildPost(
      id: effectiveId,
      ownerId: _ownerId,
      state: state,
      mentions: ref.watch(selectedMentionsProvider),
      poll: poll,
    );

    final saveDraft = ref.read(savePostDraftProvider);
    final result = await saveDraft(
      SaveOrUpdatePostDraftParams(
        post: post,
        draftType: TTexts.pollDraft,
      ),
    );
    result.fold((error) {
      TToastMessages.errorToast(error.message);
    }, (data) {
      ref.read(sendPostLoadingProvider.notifier).value = false;
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
    final effectiveId =
        _currentDraftId ?? id ?? DateTime.now().millisecondsSinceEpoch;
    _currentDraftId = effectiveId;
    final article = PostBuilder.buildArticle(
      id: effectiveId,
      ownerId: _ownerId,
      state: state,
    );
    final post = PostBuilder.buildPost(
      id: effectiveId,
      ownerId: _ownerId,
      state: state,
      mentions: ref.watch(selectedMentionsProvider),
      article: article,
    );

    final saveDraft = ref.read(savePostDraftProvider);
    final result = await saveDraft(
      SaveOrUpdatePostDraftParams(
        post: post,
        draftType: TTexts.articleDraft,
      ),
    );
    result.fold((error) {
      TToastMessages.errorToast(error.message);
    }, (data) {
      ref.read(sendPostLoadingProvider.notifier).value = false;
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
    return _withKeepAlive(() async {
      final savePoll = ref.read(savePollProvider);

      final result = await savePoll(
        SavePollParams(
          post,
        ),
      );
      return result.fold((error) async {
        // Ensure loading state is cleared on error
        ref.read(sendPostLoadingProvider.notifier).value = false;
        TToastMessages.errorToast(error.message);
        await savePollAsDraft(
          null,
          error.message,
        );

        return;
      }, (data) async {
        ref.read(sendPostLoadingProvider.notifier).value = false;
        final created = data ?? post;
        if (addToList) {
          ref.read(paginatedPostListProvider.notifier).addPost(created);
        }
        TToastMessages.successToast(
          'Your poll was sent.',
        );
        return;
      });
    });
  }

  Future<void> sendAPoll(
    int? id,
    int? pollId,
  ) async {
    return _withKeepAlive(() async {
      ref.read(sendPostLoadingProvider.notifier).value = true;
      final scheduledDateTime = ref.watch(postScheduledDateTimeProvider);
      final scheduledDateTimeProvider = ref.read(
        postScheduledDateTimeProvider.notifier,
      );

      final ownerId = _ownerId;
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
      final poll = PostBuilder.buildPoll(
        id: pollId,
        ownerId: ownerId,
        state: state,
        pollId: pollId,
      );
      final post = PostBuilder.buildPost(
        id: postId,
        ownerId: ownerId,
        state: state,
        mentions: ref.watch(selectedMentionsProvider),
        postType: PostType.poll,
        poll: poll,
      );

      await _retryWithBackoff(() async {
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
      });
      return;
    });
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
      TToastMessages.errorToast(error);
      await saveArticleAsDraft(
        id,
        error,
      );

      return;
    }, (mediaUrls) {
      final pathReplacements = THelperFunctions.mapEmbededImages(
        embeddedImages,
        mediaUrls,
      );
      final modifiedContent = THelperFunctions.modifyArticleContent(
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
    return _withKeepAlive(() async {
      final saveArticle = ref.read(saveArticleProvider);

      final result = await saveArticle(
        SaveArticleParams(
          post,
        ),
      );
      return result.fold((error) async {
        TToastMessages.errorToast(error.message);
        await saveArticleAsDraft(
          null,
          error.message,
        );

        return;
      }, (data) async {
        ref.read(sendPostLoadingProvider.notifier).value = false;
        if (data == null) {
          await saveArticleAsDraft(
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
          'Your article was sent.',
        );
        return;
      });
    });
  }

  Future<void> sendAnArticle(
    int? id,
  ) async {
    return _withKeepAlive(() async {
      ref.read(sendPostLoadingProvider.notifier).value = true;
      final scheduledDateTime = ref.watch(postScheduledDateTimeProvider);
      final scheduledDateTimeProvider = ref.read(
        postScheduledDateTimeProvider.notifier,
      );

      final ownerId = _ownerId;
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
      final embeddedImages = THelperFunctions.getAllImagesFromEditor(
        state.articleContent,
      );
      if (embeddedImages.isNotEmpty) {
        await sendMediaAndModifyContent(
          postId,
          embeddedImages,
          state.articleContent,
        );
      }

      final article = PostBuilder.buildArticle(
        ownerId: ownerId,
        state: state,
      );

      final post = PostBuilder.buildPost(
        id: postId,
        ownerId: ownerId,
        state: state,
        mentions: state.mentions,
        article: article,
        postType: PostType.article,
      );

      await _retryWithBackoff(() async {
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
      });
      return;
    });
  }

  @override
  PostCreationState build(Post? post) {
    if (post == null) {
      final feedState = PostCreationState.empty();
      feedState.controller.addListener(() {
        if (!ref.mounted) return;
        setText(feedState.controller.text);
      });

      return feedState;
    } else {
      final feedState = PostCreationState.populate(post);
      feedState.controller.addListener(() {
        if (!ref.mounted) return;
        setText(feedState.controller.text);
      });

      if (post.article != null) {
        if (post.article!.content != null) {
          feedState.articleController!.addListener(
            () {
              if (!ref.mounted) return;
              setContent(
                jsonEncode(
                  feedState.articleController!.document.toDelta().toJson(),
                ),
              );
            },
          );
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
