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
    GetUserBookmarksUseCase,
    GetUserBookmarksUseCase,
    GetUserBookmarksUseCase> with $Provider<GetUserBookmarksUseCase> {
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
  $ProviderElement<GetUserBookmarksUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetUserBookmarksUseCase create(Ref ref) {
    return getUserPostBookmarks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUserBookmarksUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetUserBookmarksUseCase>(value),
    );
  }
}

String _$getUserPostBookmarksHash() =>
    r'6be3f0b969c8bd636029985ddf9a7da6cb650b18';

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
    SaveOrUpdatePostDraftUseCase,
    SaveOrUpdatePostDraftUseCase,
    SaveOrUpdatePostDraftUseCase> with $Provider<SaveOrUpdatePostDraftUseCase> {
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
  $ProviderElement<SaveOrUpdatePostDraftUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveOrUpdatePostDraftUseCase create(Ref ref) {
    return savePostDraft(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveOrUpdatePostDraftUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveOrUpdatePostDraftUseCase>(value),
    );
  }
}

String _$savePostDraftHash() => r'1331f63d0fdbbbbc337121888ca9f7fa2c01ee08';

@ProviderFor(getPostDrafts)
const getPostDraftsProvider = GetPostDraftsProvider._();

final class GetPostDraftsProvider extends $FunctionalProvider<
    GetPostDraftsUseCase,
    GetPostDraftsUseCase,
    GetPostDraftsUseCase> with $Provider<GetPostDraftsUseCase> {
  const GetPostDraftsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getPostDraftsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getPostDraftsHash();

  @$internal
  @override
  $ProviderElement<GetPostDraftsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetPostDraftsUseCase create(Ref ref) {
    return getPostDrafts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPostDraftsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPostDraftsUseCase>(value),
    );
  }
}

String _$getPostDraftsHash() => r'3052c5991d4c8ce0eba7fabef8df797c4f86b1a3';

@ProviderFor(deletePostDraft)
const deletePostDraftProvider = DeletePostDraftProvider._();

final class DeletePostDraftProvider extends $FunctionalProvider<
    DeletePostDraftByIdUseCase,
    DeletePostDraftByIdUseCase,
    DeletePostDraftByIdUseCase> with $Provider<DeletePostDraftByIdUseCase> {
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
  $ProviderElement<DeletePostDraftByIdUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeletePostDraftByIdUseCase create(Ref ref) {
    return deletePostDraft(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeletePostDraftByIdUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeletePostDraftByIdUseCase>(value),
    );
  }
}

String _$deletePostDraftHash() => r'a19972a588e94c2231848c49f4d1900ab75af088';

@ProviderFor(clearPostDrafts)
const clearPostDraftsProvider = ClearPostDraftsProvider._();

final class ClearPostDraftsProvider extends $FunctionalProvider<
    ClearPostDraftsUseCase,
    ClearPostDraftsUseCase,
    ClearPostDraftsUseCase> with $Provider<ClearPostDraftsUseCase> {
  const ClearPostDraftsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'clearPostDraftsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$clearPostDraftsHash();

  @$internal
  @override
  $ProviderElement<ClearPostDraftsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClearPostDraftsUseCase create(Ref ref) {
    return clearPostDrafts(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClearPostDraftsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClearPostDraftsUseCase>(value),
    );
  }
}

String _$clearPostDraftsHash() => r'58502d2762808eb0577a267062e00d38508f9d1f';

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

@ProviderFor(quotePost)
const quotePostProvider = QuotePostProvider._();

final class QuotePostProvider extends $FunctionalProvider<QuotePostUseCase,
    QuotePostUseCase, QuotePostUseCase> with $Provider<QuotePostUseCase> {
  const QuotePostProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'quotePostProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$quotePostHash();

  @$internal
  @override
  $ProviderElement<QuotePostUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  QuotePostUseCase create(Ref ref) {
    return quotePost(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QuotePostUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QuotePostUseCase>(value),
    );
  }
}

String _$quotePostHash() => r'423255e3e002a82b09748de1062cdbed8c126033';

@ProviderFor(repostPost)
const repostPostProvider = RepostPostProvider._();

final class RepostPostProvider extends $FunctionalProvider<RepostPostUseCase,
    RepostPostUseCase, RepostPostUseCase> with $Provider<RepostPostUseCase> {
  const RepostPostProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'repostPostProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$repostPostHash();

  @$internal
  @override
  $ProviderElement<RepostPostUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RepostPostUseCase create(Ref ref) {
    return repostPost(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RepostPostUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RepostPostUseCase>(value),
    );
  }
}

String _$repostPostHash() => r'4dee7f31e6299fdf9f4607ecb1b33060b2809e5c';

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

@ProviderFor(recordPostImpression)
const recordPostImpressionProvider = RecordPostImpressionProvider._();

final class RecordPostImpressionProvider extends $FunctionalProvider<
    RecordPostImpressionUseCase,
    RecordPostImpressionUseCase,
    RecordPostImpressionUseCase> with $Provider<RecordPostImpressionUseCase> {
  const RecordPostImpressionProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'recordPostImpressionProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$recordPostImpressionHash();

  @$internal
  @override
  $ProviderElement<RecordPostImpressionUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RecordPostImpressionUseCase create(Ref ref) {
    return recordPostImpression(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecordPostImpressionUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecordPostImpressionUseCase>(value),
    );
  }
}

String _$recordPostImpressionHash() =>
    r'324a313a4b1087e01e12c5cd2c5b45e1b07e65d2';

@ProviderFor(flushPostImpressions)
const flushPostImpressionsProvider = FlushPostImpressionsProvider._();

final class FlushPostImpressionsProvider extends $FunctionalProvider<
    FlushPostImpressionsUseCase,
    FlushPostImpressionsUseCase,
    FlushPostImpressionsUseCase> with $Provider<FlushPostImpressionsUseCase> {
  const FlushPostImpressionsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'flushPostImpressionsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$flushPostImpressionsHash();

  @$internal
  @override
  $ProviderElement<FlushPostImpressionsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FlushPostImpressionsUseCase create(Ref ref) {
    return flushPostImpressions(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlushPostImpressionsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlushPostImpressionsUseCase>(value),
    );
  }
}

String _$flushPostImpressionsHash() =>
    r'6e518a9df8c07a36c3b030b9b534be9b4d592721';
