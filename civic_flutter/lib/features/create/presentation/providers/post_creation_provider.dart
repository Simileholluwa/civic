import 'dart:convert';
import 'dart:developer';

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

  int? _currentDraftId;

  int get _ownerId => ref.read(localStorageProvider).getInt('userId')!;

  Future<T> _withKeepAlive<T>(Future<T> Function() action) async {
    final link = ref.keepAlive();
    try {
      return await action();
    } finally {
      link.close();
    }
  }

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

  void loadFromDraft(Post draft) {
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

    final draftMentions = draft.mentions ?? <UserRecord>[];
    ref.read(selectedMentionsProvider.notifier).setMentions = draftMentions;

    var next = PostCreationState.populate(draft);

    if (draft.poll?.options != null) {
      final raw = draft.poll!.options
              ?.map((o) => o.option ?? '')
              .toList(growable: true) ??
          <String>[];
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
    if ((draft.mediaAssets?.isNotEmpty ?? false) &&
        draft.mediaAssets!.first.kind == MediaKind.video) {
      ref.read(mediaVideoPlayerProvider(next.videoUrl));
    }
    state = next;
    _currentDraftId = draft.id;
  }

  String hintText(String username, bool? isComment, bool? isReply) {
    if (isImages()) {
      return '$username, caption your images';
    } else if (isImage()) {
      return '$username, caption your image';
    } else if (isVideo()) {
      return '$username, caption your video';
    } else if (isComment ?? false) {
      return '$username, share your thoughts on this post...';
    } else if (isReply ?? false) {
      return '$username, share your thoughts on this reply...';
    } else {
      return "$username, what's happening in politics? Tap here "
          'to start typing.';
    }
  }

  Future<void> savePostAsDraft(
    int? id,
    String? errorMesage,
  ) async {
    final effectiveId =
        _currentDraftId ?? id ?? DateTime.now().millisecondsSinceEpoch;
    _currentDraftId = effectiveId;
    final post = PostBuilder.buildPost(
      id: effectiveId,
      ownerId: _ownerId,
      state: state,
      mentions: ref.watch(selectedMentionsProvider),
      includeLocalMedia: true,
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

  Future<bool> _uploadAssetsToPostId() async {
    // Separate local images (to upload) and remote images (already on server)
    final localImages = state.imageUrls
        .where((p) => !_urlRegex.hasMatch(p))
        .toList(growable: false);
    final remoteImages = state.imageUrls
        .where(_urlRegex.hasMatch)
        .toList(growable: false);
    final videoPath = state.videoUrl;
    final assets = <MediaAsset>[];

    // Add existing remote image MediaAssets (from state.uploadedAssets)
    if (remoteImages.isNotEmpty && state.uploadedAssets.isNotEmpty) {
      final remoteAssets = state.uploadedAssets
          .where((a) =>
              a.kind == MediaKind.image &&
              a.publicUrl != null &&
              remoteImages.contains(a.publicUrl))
          .toList();
      assets.addAll(remoteAssets);
    }

    // Upload new local images
    if (localImages.isNotEmpty) {
      final res = await ref.read(assetServiceProvider).uploadPostMediaAssets(
        localImages,
      );
      if (res.isLeft()) {
        ref.read(sendPostLoadingProvider.notifier).value = false;
        final err = res.getLeft().toNullable()!;
        log(err);
        return false;
      }
      assets.addAll(res.getRight().toNullable()!);
    }

    // Handle video (same logic as before)
    if (videoPath.isNotEmpty && !_urlRegex.hasMatch(videoPath)) {
      final res = await ref.read(assetServiceProvider).uploadPostMediaAssets(
        [videoPath],
      );
      if (res.isLeft()) {
        final err = res.getLeft().toNullable()!;
        log(err);
        return false;
      }
      assets.addAll(res.getRight().toNullable()!);
    }

    state = state.copyWith(uploadedAssets: assets);
    return true;
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
                PostWithUserState(post: data),
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
        SchedulePostParams(
          post.copyWith(
            mediaAssets: state.uploadedAssets,
          ),
          dateTime,
        ),
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

  Future<void> quoteProject(
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
        postType: PostType.projectQuote,
        projectId: projectId,
      );
      final result = await repostQuote(
        RepostOrQuoteParams(
          projectId!,
          quoteContent,
        ),
      );
      return result.fold((error) async {
        TToastMessages.errorToast(
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
                PostWithUserState(post: post),
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

      var post = PostBuilder.buildPost(
        id: postId,
        ownerId: ownerId,
        state: state,
        mentions: ref.watch(selectedMentionsProvider),
        postType: PostType.regular,
      );

      final uploadedOk = await _uploadAssetsToPostId();
      if (!uploadedOk) {
        ref.read(sendPostLoadingProvider.notifier).value = false;
        await savePostAsDraft(
          null,
          'Failed to upload media assets',
        );
        return;
      }

      post = post.copyWith(mediaAssets: state.uploadedAssets);

      await _retryWithBackoff(() async {
        if (scheduledDateTime == null &&
            !scheduledDateTimeProvider.canSendLater()) {
          await sendPost(post, true);
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
      final uploadedOk = await _uploadAssetsToPostId();
      if (!uploadedOk) {
        ref.read(sendPostLoadingProvider.notifier).value = false;
        return;
      }
      final mediaAssets = state.uploadedAssets;
      final result = await saveComment(
        SavePostCommentParams(
          Post(
            id: id,
            ownerId: ownerId,
            text: state.text.trim(),
            locations: state.locations,
            taggedUsers: state.taggedUsers,
            mentions: ref.watch(selectedMentionsProvider),
            parentId: postId,
            mediaAssets: mediaAssets,
          ),
          false,
        ),
      );
      await result.fold((l) {
        TToastMessages.errorToast(l.message);
        ref.read(sendPostLoadingProvider.notifier).value = false;
      }, (r) async {
        TToastMessages.successToast('Your comment has been sent.');

        ref
            .watch(
              paginatedCommentListProvider(postId).notifier,
            )
            .addComment(
              PostWithUserState(
                post: r!,
              ),
            );

        ref.read(sendPostLoadingProvider.notifier).value = false;
      });
    });
  }

  Future<Post?> quotePost(
    int postId,
  ) async {
    final useCase = ref.read(quotePostProvider);
    final result = await useCase(
      QuotePostParams(
        postId,
        Post(
          ownerId: _ownerId,
          text: state.text.trim(),
          mentions: ref.watch(selectedMentionsProvider),
          postType: PostType.postQuote,
        ),
      ),
    );
    return result.fold(
      (error) {
        TToastMessages.errorToast(error.message);
        return null;
      },
      (post) {
        TToastMessages.successToast('Your quote has been posted.');
        return post;
      },
    );
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
      final uploadedOk = await _uploadAssetsToPostId();
      if (!uploadedOk) {
        ref.read(sendPostLoadingProvider.notifier).value = false;
        return;
      }
      final mediaAssets = state.uploadedAssets;
      final result = await saveReply(
        SavePostCommentParams(
          Post(
            id: id,
            ownerId: ownerId,
            text: state.text.trim(),
            locations: state.locations,
            taggedUsers: state.taggedUsers,
            mentions: ref.watch(selectedMentionsProvider),
            parentId: parentId,
            mediaAssets: mediaAssets,
          ),
          true,
        ),
      );
      await result.fold(
        (l) {
          TToastMessages.errorToast(l.message);
          ref.read(sendPostLoadingProvider.notifier).value = false;
        },
        (r) async {
          TToastMessages.successToast('Your reply has been sent.');
          if (id == null) {
            ref.read(paginatedRepliesListProvider(parentId).notifier).addReply(
                  PostWithUserState(
                    post: r!,
                  ),
                );
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
      includeLocalMedia: true,
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
      includeLocalMedia: true,
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
      final result = await savePoll(SavePollParams(post));
      return result.fold((error) async {
        ref.read(sendPostLoadingProvider.notifier).value = false;
        TToastMessages.errorToast(error.message);
        await savePollAsDraft(
          null,
          error.message,
        );

        return;
      }, (data) async {
        ref.read(sendPostLoadingProvider.notifier).value = false;
        if (data == null) {
          await savePollAsDraft(
            null,
            'Something went wrong',
          );
        }
        if (addToList) {
          ref.read(paginatedPostListProvider.notifier).addPost(
                PostWithUserState(post: data!),
              );
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
        ref.read(paginatedPostListProvider.notifier).addPost(
              PostWithUserState(post: data),
            );

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

      var post = PostBuilder.buildPost(
        id: postId,
        ownerId: ownerId,
        state: state,
        mentions: state.mentions,
        article: article,
        postType: PostType.article,
      );

      final uploadedOk = await _uploadAssetsToPostId();
      if (!uploadedOk) {
        ref.read(sendPostLoadingProvider.notifier).value = false;
        await saveArticleAsDraft(
          null,
          'Failed to upload media assets',
        );
        return;
      }
      final mediaAssets = state.uploadedAssets;
      post = post.copyWith(mediaAssets: mediaAssets);

      await _retryWithBackoff(() async {
        if (scheduledDateTime == null &&
            !scheduledDateTimeProvider.canSendLater()) {
          await sendArticle(
            post,
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
      return feedState;
    }
  }
}
