// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(feedLocalDatabase)
const feedLocalDatabaseProvider = FeedLocalDatabaseProvider._();

final class FeedLocalDatabaseProvider extends $FunctionalProvider<
    FeedLocalDatabaseImpl,
    FeedLocalDatabaseImpl,
    FeedLocalDatabaseImpl> with $Provider<FeedLocalDatabaseImpl> {
  const FeedLocalDatabaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'feedLocalDatabaseProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$feedLocalDatabaseHash();

  @$internal
  @override
  $ProviderElement<FeedLocalDatabaseImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FeedLocalDatabaseImpl create(Ref ref) {
    return feedLocalDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedLocalDatabaseImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedLocalDatabaseImpl>(value),
    );
  }
}

String _$feedLocalDatabaseHash() => r'3a4e9a761dd9064543e1277c6a5e33a39c4ec269';

@ProviderFor(feedRemoteDatabase)
const feedRemoteDatabaseProvider = FeedRemoteDatabaseProvider._();

final class FeedRemoteDatabaseProvider extends $FunctionalProvider<
    FeedRemoteDatabaseImpl,
    FeedRemoteDatabaseImpl,
    FeedRemoteDatabaseImpl> with $Provider<FeedRemoteDatabaseImpl> {
  const FeedRemoteDatabaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'feedRemoteDatabaseProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$feedRemoteDatabaseHash();

  @$internal
  @override
  $ProviderElement<FeedRemoteDatabaseImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FeedRemoteDatabaseImpl create(Ref ref) {
    return feedRemoteDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedRemoteDatabaseImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedRemoteDatabaseImpl>(value),
    );
  }
}

String _$feedRemoteDatabaseHash() =>
    r'2044c98cd420afb62bddd75cf629ad38daee8108';

@ProviderFor(feedRepositoryImpl)
const feedRepositoryImplProvider = FeedRepositoryImplProvider._();

final class FeedRepositoryImplProvider extends $FunctionalProvider<
    FeedRepositoryImpl,
    FeedRepositoryImpl,
    FeedRepositoryImpl> with $Provider<FeedRepositoryImpl> {
  const FeedRepositoryImplProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'feedRepositoryImplProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$feedRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<FeedRepositoryImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FeedRepositoryImpl create(Ref ref) {
    return feedRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FeedRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FeedRepositoryImpl>(value),
    );
  }
}

String _$feedRepositoryImplHash() =>
    r'1a698b2979c71ab2a7910cf9439f3b26ff86318f';

@ProviderFor(savePost)
const savePostProvider = SavePostProvider._();

final class SavePostProvider extends $FunctionalProvider<SavePostUseCase,
    SavePostUseCase, SavePostUseCase> with $Provider<SavePostUseCase> {
  const SavePostProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savePostProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savePostHash();

  @$internal
  @override
  $ProviderElement<SavePostUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SavePostUseCase create(Ref ref) {
    return savePost(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavePostUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavePostUseCase>(value),
    );
  }
}

String _$savePostHash() => r'40d473d438893063be0d35535006bd399ab71948';

@ProviderFor(getPosts)
const getPostsProvider = GetPostsProvider._();

final class GetPostsProvider extends $FunctionalProvider<GetPostsUseCase,
    GetPostsUseCase, GetPostsUseCase> with $Provider<GetPostsUseCase> {
  const GetPostsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getPostsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getPostsHash();

  @$internal
  @override
  $ProviderElement<GetPostsUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPostsUseCase create(Ref ref) {
    return getPosts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPostsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPostsUseCase>(value),
    );
  }
}

String _$getPostsHash() => r'4cdbfb27207cc0c5508625bff1423bc2cf7c59ec';

@ProviderFor(getPost)
const getPostProvider = GetPostProvider._();

final class GetPostProvider
    extends $FunctionalProvider<GetPostUseCase, GetPostUseCase, GetPostUseCase>
    with $Provider<GetPostUseCase> {
  const GetPostProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getPostProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getPostHash();

  @$internal
  @override
  $ProviderElement<GetPostUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPostUseCase create(Ref ref) {
    return getPost(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPostUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPostUseCase>(value),
    );
  }
}

String _$getPostHash() => r'0d07205d6703097db52f9e084fdda86248c93036';

@ProviderFor(getUserPostBookmarks)
const getUserPostBookmarksProvider = GetUserPostBookmarksProvider._();

final class GetUserPostBookmarksProvider extends $FunctionalProvider<
    GetUserPostBookmarksUseCase,
    GetUserPostBookmarksUseCase,
    GetUserPostBookmarksUseCase> with $Provider<GetUserPostBookmarksUseCase> {
  const GetUserPostBookmarksProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getUserPostBookmarksProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getUserPostBookmarksHash();

  @$internal
  @override
  $ProviderElement<GetUserPostBookmarksUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetUserPostBookmarksUseCase create(Ref ref) {
    return getUserPostBookmarks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUserPostBookmarksUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUserPostBookmarksUseCase>(value),
    );
  }
}

String _$getUserPostBookmarksHash() =>
    r'55ee326d54cdeb6956468ce1b0548b0701767b67';

@ProviderFor(clearPostBookmarks)
const clearPostBookmarksProvider = ClearPostBookmarksProvider._();

final class ClearPostBookmarksProvider extends $FunctionalProvider<
    ClearPostBookmarksUseCase,
    ClearPostBookmarksUseCase,
    ClearPostBookmarksUseCase> with $Provider<ClearPostBookmarksUseCase> {
  const ClearPostBookmarksProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'clearPostBookmarksProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$clearPostBookmarksHash();

  @$internal
  @override
  $ProviderElement<ClearPostBookmarksUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClearPostBookmarksUseCase create(Ref ref) {
    return clearPostBookmarks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClearPostBookmarksUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClearPostBookmarksUseCase>(value),
    );
  }
}

String _$clearPostBookmarksHash() =>
    r'6654bd7d044c7f6cf1e7f86b6e0eb8da8c1e9480';

@ProviderFor(savePostDraft)
const savePostDraftProvider = SavePostDraftProvider._();

final class SavePostDraftProvider extends $FunctionalProvider<
    SavePostDraftUseCase,
    SavePostDraftUseCase,
    SavePostDraftUseCase> with $Provider<SavePostDraftUseCase> {
  const SavePostDraftProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savePostDraftProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savePostDraftHash();

  @$internal
  @override
  $ProviderElement<SavePostDraftUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SavePostDraftUseCase create(Ref ref) {
    return savePostDraft(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavePostDraftUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavePostDraftUseCase>(value),
    );
  }
}

String _$savePostDraftHash() => r'931581affc97199eedc569b2658174fbe7908bbc';

@ProviderFor(getPostDraft)
const getPostDraftProvider = GetPostDraftProvider._();

final class GetPostDraftProvider extends $FunctionalProvider<
    GetPostDraftUseCase,
    GetPostDraftUseCase,
    GetPostDraftUseCase> with $Provider<GetPostDraftUseCase> {
  const GetPostDraftProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getPostDraftProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getPostDraftHash();

  @$internal
  @override
  $ProviderElement<GetPostDraftUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPostDraftUseCase create(Ref ref) {
    return getPostDraft(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPostDraftUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPostDraftUseCase>(value),
    );
  }
}

String _$getPostDraftHash() => r'9a94b4fc20b949a05833e13cc775d86e86b73778';

@ProviderFor(deletePostDraft)
const deletePostDraftProvider = DeletePostDraftProvider._();

final class DeletePostDraftProvider extends $FunctionalProvider<
    DeletePostDraftUseCase,
    DeletePostDraftUseCase,
    DeletePostDraftUseCase> with $Provider<DeletePostDraftUseCase> {
  const DeletePostDraftProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deletePostDraftProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deletePostDraftHash();

  @$internal
  @override
  $ProviderElement<DeletePostDraftUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeletePostDraftUseCase create(Ref ref) {
    return deletePostDraft(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeletePostDraftUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeletePostDraftUseCase>(value),
    );
  }
}

String _$deletePostDraftHash() => r'85937821a06349483e8a359f7d6510dffd3283bf';

@ProviderFor(deletePost)
const deletePostProvider = DeletePostProvider._();

final class DeletePostProvider extends $FunctionalProvider<DeletePostUseCase,
    DeletePostUseCase, DeletePostUseCase> with $Provider<DeletePostUseCase> {
  const DeletePostProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deletePostProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deletePostHash();

  @$internal
  @override
  $ProviderElement<DeletePostUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeletePostUseCase create(Ref ref) {
    return deletePost(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeletePostUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeletePostUseCase>(value),
    );
  }
}

String _$deletePostHash() => r'182fd4e3d3532a8268d0853b913eeda56ece0c04';

@ProviderFor(subscribeToNotif)
const subscribeToNotifProvider = SubscribeToNotifProvider._();

final class SubscribeToNotifProvider extends $FunctionalProvider<
    SubscribeToNotifUseCase,
    SubscribeToNotifUseCase,
    SubscribeToNotifUseCase> with $Provider<SubscribeToNotifUseCase> {
  const SubscribeToNotifProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'subscribeToNotifProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$subscribeToNotifHash();

  @$internal
  @override
  $ProviderElement<SubscribeToNotifUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SubscribeToNotifUseCase create(Ref ref) {
    return subscribeToNotif(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubscribeToNotifUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubscribeToNotifUseCase>(value),
    );
  }
}

String _$subscribeToNotifHash() => r'86e000194bcb5bb390ae0a6002bf802a76fa3237';

@ProviderFor(schedulePost)
const schedulePostProvider = SchedulePostProvider._();

final class SchedulePostProvider extends $FunctionalProvider<
    SchedulePostUseCase,
    SchedulePostUseCase,
    SchedulePostUseCase> with $Provider<SchedulePostUseCase> {
  const SchedulePostProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'schedulePostProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$schedulePostHash();

  @$internal
  @override
  $ProviderElement<SchedulePostUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SchedulePostUseCase create(Ref ref) {
    return schedulePost(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SchedulePostUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SchedulePostUseCase>(value),
    );
  }
}

String _$schedulePostHash() => r'8948010478ff7b49dd72477f1b5b3d0985918ab7';

@ProviderFor(togglePostLike)
const togglePostLikeProvider = TogglePostLikeProvider._();

final class TogglePostLikeProvider extends $FunctionalProvider<
    TogglePostLikeUseCase,
    TogglePostLikeUseCase,
    TogglePostLikeUseCase> with $Provider<TogglePostLikeUseCase> {
  const TogglePostLikeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'togglePostLikeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$togglePostLikeHash();

  @$internal
  @override
  $ProviderElement<TogglePostLikeUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TogglePostLikeUseCase create(Ref ref) {
    return togglePostLike(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TogglePostLikeUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TogglePostLikeUseCase>(value),
    );
  }
}

String _$togglePostLikeHash() => r'32d530992c88f5ff16c1034b99382eb74c2b17cd';

@ProviderFor(repostOrQuotePost)
const repostOrQuotePostProvider = RepostOrQuotePostProvider._();

final class RepostOrQuotePostProvider extends $FunctionalProvider<
    RepostOrQuoteUseCase,
    RepostOrQuoteUseCase,
    RepostOrQuoteUseCase> with $Provider<RepostOrQuoteUseCase> {
  const RepostOrQuotePostProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'repostOrQuotePostProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repostOrQuotePostHash();

  @$internal
  @override
  $ProviderElement<RepostOrQuoteUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RepostOrQuoteUseCase create(Ref ref) {
    return repostOrQuotePost(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RepostOrQuoteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RepostOrQuoteUseCase>(value),
    );
  }
}

String _$repostOrQuotePostHash() => r'657b6b9ba08984176a32079ae67c8bd8d94dc2ee';

@ProviderFor(togglePostBookmark)
const togglePostBookmarkProvider = TogglePostBookmarkProvider._();

final class TogglePostBookmarkProvider extends $FunctionalProvider<
    TogglePostBookmarkUseCase,
    TogglePostBookmarkUseCase,
    TogglePostBookmarkUseCase> with $Provider<TogglePostBookmarkUseCase> {
  const TogglePostBookmarkProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'togglePostBookmarkProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$togglePostBookmarkHash();

  @$internal
  @override
  $ProviderElement<TogglePostBookmarkUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TogglePostBookmarkUseCase create(Ref ref) {
    return togglePostBookmark(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TogglePostBookmarkUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TogglePostBookmarkUseCase>(value),
    );
  }
}

String _$togglePostBookmarkHash() =>
    r'4c936a20434df8d885e373ac9c4baaffe2d09a48';

@ProviderFor(markPostNotInterested)
const markPostNotInterestedProvider = MarkPostNotInterestedProvider._();

final class MarkPostNotInterestedProvider extends $FunctionalProvider<
    MarkPostNotInterestedUseCase,
    MarkPostNotInterestedUseCase,
    MarkPostNotInterestedUseCase> with $Provider<MarkPostNotInterestedUseCase> {
  const MarkPostNotInterestedProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'markPostNotInterestedProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$markPostNotInterestedHash();

  @$internal
  @override
  $ProviderElement<MarkPostNotInterestedUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MarkPostNotInterestedUseCase create(Ref ref) {
    return markPostNotInterested(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MarkPostNotInterestedUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MarkPostNotInterestedUseCase>(value),
    );
  }
}

String _$markPostNotInterestedHash() =>
    r'029467d3e711db57831e492184974593522997db';

@ProviderFor(savePostComment)
const savePostCommentProvider = SavePostCommentProvider._();

final class SavePostCommentProvider extends $FunctionalProvider<
    SavePostCommentUseCase,
    SavePostCommentUseCase,
    SavePostCommentUseCase> with $Provider<SavePostCommentUseCase> {
  const SavePostCommentProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savePostCommentProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savePostCommentHash();

  @$internal
  @override
  $ProviderElement<SavePostCommentUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SavePostCommentUseCase create(Ref ref) {
    return savePostComment(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavePostCommentUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavePostCommentUseCase>(value),
    );
  }
}

String _$savePostCommentHash() => r'2fee4e8f9c70a3af59a9d7feb406b093a875a231';

@ProviderFor(getPostComments)
const getPostCommentsProvider = GetPostCommentsProvider._();

final class GetPostCommentsProvider extends $FunctionalProvider<
    GetPostCommentsUseCase,
    GetPostCommentsUseCase,
    GetPostCommentsUseCase> with $Provider<GetPostCommentsUseCase> {
  const GetPostCommentsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getPostCommentsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getPostCommentsHash();

  @$internal
  @override
  $ProviderElement<GetPostCommentsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPostCommentsUseCase create(Ref ref) {
    return getPostComments(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPostCommentsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPostCommentsUseCase>(value),
    );
  }
}

String _$getPostCommentsHash() => r'9aad0697e93bfe227f2d565f9bd54930fa20db7f';

@ProviderFor(getCommentDetail)
const getCommentDetailProvider = GetCommentDetailProvider._();

final class GetCommentDetailProvider extends $FunctionalProvider<
    GetCommentUseCase,
    GetCommentUseCase,
    GetCommentUseCase> with $Provider<GetCommentUseCase> {
  const GetCommentDetailProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getCommentDetailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getCommentDetailHash();

  @$internal
  @override
  $ProviderElement<GetCommentUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetCommentUseCase create(Ref ref) {
    return getCommentDetail(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCommentUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCommentUseCase>(value),
    );
  }
}

String _$getCommentDetailHash() => r'793ecbe9cf295f18b117ba94bdb1683432d2072d';

@ProviderFor(getPostCommentReplies)
const getPostCommentRepliesProvider = GetPostCommentRepliesProvider._();

final class GetPostCommentRepliesProvider extends $FunctionalProvider<
    GetPostCommentRepliesUseCase,
    GetPostCommentRepliesUseCase,
    GetPostCommentRepliesUseCase> with $Provider<GetPostCommentRepliesUseCase> {
  const GetPostCommentRepliesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getPostCommentRepliesProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getPostCommentRepliesHash();

  @$internal
  @override
  $ProviderElement<GetPostCommentRepliesUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPostCommentRepliesUseCase create(Ref ref) {
    return getPostCommentReplies(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPostCommentRepliesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPostCommentRepliesUseCase>(value),
    );
  }
}

String _$getPostCommentRepliesHash() =>
    r'90364fe00c474de94917c9c5c852c98c9700eed0';

@ProviderFor(savePoll)
const savePollProvider = SavePollProvider._();

final class SavePollProvider extends $FunctionalProvider<SavePollUseCase,
    SavePollUseCase, SavePollUseCase> with $Provider<SavePollUseCase> {
  const SavePollProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savePollProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savePollHash();

  @$internal
  @override
  $ProviderElement<SavePollUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SavePollUseCase create(Ref ref) {
    return savePoll(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SavePollUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SavePollUseCase>(value),
    );
  }
}

String _$savePollHash() => r'692b9d9a420e91437f1e514bc3ac4794b795c9b2';

@ProviderFor(getPolls)
const getPollsProvider = GetPollsProvider._();

final class GetPollsProvider extends $FunctionalProvider<GetPollsUseCase,
    GetPollsUseCase, GetPollsUseCase> with $Provider<GetPollsUseCase> {
  const GetPollsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getPollsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getPollsHash();

  @$internal
  @override
  $ProviderElement<GetPollsUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPollsUseCase create(Ref ref) {
    return getPolls(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPollsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPollsUseCase>(value),
    );
  }
}

String _$getPollsHash() => r'4592c3f81263744efba5afa7cf59791e6fd3d7fd';

@ProviderFor(castVote)
const castVoteProvider = CastVoteProvider._();

final class CastVoteProvider extends $FunctionalProvider<CastVoteUseCase,
    CastVoteUseCase, CastVoteUseCase> with $Provider<CastVoteUseCase> {
  const CastVoteProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'castVoteProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$castVoteHash();

  @$internal
  @override
  $ProviderElement<CastVoteUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CastVoteUseCase create(Ref ref) {
    return castVote(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CastVoteUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CastVoteUseCase>(value),
    );
  }
}

String _$castVoteHash() => r'6aa14e73aa61064e97aa186840c48c8a1fb58063';

@ProviderFor(getArticles)
const getArticlesProvider = GetArticlesProvider._();

final class GetArticlesProvider extends $FunctionalProvider<GetArticlesUseCase,
    GetArticlesUseCase, GetArticlesUseCase> with $Provider<GetArticlesUseCase> {
  const GetArticlesProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getArticlesProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getArticlesHash();

  @$internal
  @override
  $ProviderElement<GetArticlesUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetArticlesUseCase create(Ref ref) {
    return getArticles(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetArticlesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetArticlesUseCase>(value),
    );
  }
}

String _$getArticlesHash() => r'612fbfeea14e9153926d82ca3eeef890b89f5d57';

@ProviderFor(saveArticle)
const saveArticleProvider = SaveArticleProvider._();

final class SaveArticleProvider extends $FunctionalProvider<SaveArticleUseCase,
    SaveArticleUseCase, SaveArticleUseCase> with $Provider<SaveArticleUseCase> {
  const SaveArticleProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'saveArticleProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$saveArticleHash();

  @$internal
  @override
  $ProviderElement<SaveArticleUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveArticleUseCase create(Ref ref) {
    return saveArticle(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveArticleUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveArticleUseCase>(value),
    );
  }
}

String _$saveArticleHash() => r'e23dda5fa1e9f638255ae1c06bd790814abf258f';
