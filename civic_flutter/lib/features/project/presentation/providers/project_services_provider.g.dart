// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_services_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(projectRemoteDatasource)
const projectRemoteDatasourceProvider = ProjectRemoteDatasourceProvider._();

final class ProjectRemoteDatasourceProvider extends $FunctionalProvider<
    ProjectRemoteDatasourceImpl,
    ProjectRemoteDatasourceImpl,
    ProjectRemoteDatasourceImpl> with $Provider<ProjectRemoteDatasourceImpl> {
  const ProjectRemoteDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'projectRemoteDatasourceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<ProjectRemoteDatasourceImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectRemoteDatasourceImpl create(Ref ref) {
    return projectRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectRemoteDatasourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectRemoteDatasourceImpl>(value),
    );
  }
}

String _$projectRemoteDatasourceHash() =>
    r'fc1ca9059415b14e6455b0c1ebc638ce01f7b4f9';

@ProviderFor(projectLocalDatasource)
const projectLocalDatasourceProvider = ProjectLocalDatasourceProvider._();

final class ProjectLocalDatasourceProvider extends $FunctionalProvider<
    ProjectLocalDataSourceImpl,
    ProjectLocalDataSourceImpl,
    ProjectLocalDataSourceImpl> with $Provider<ProjectLocalDataSourceImpl> {
  const ProjectLocalDatasourceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'projectLocalDatasourceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectLocalDatasourceHash();

  @$internal
  @override
  $ProviderElement<ProjectLocalDataSourceImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectLocalDataSourceImpl create(Ref ref) {
    return projectLocalDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectLocalDataSourceImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectLocalDataSourceImpl>(value),
    );
  }
}

String _$projectLocalDatasourceHash() =>
    r'9806cc200c6e52c6c553ca1fe33b0805a8b4baeb';

@ProviderFor(projectRepositoryImpl)
const projectRepositoryImplProvider = ProjectRepositoryImplProvider._();

final class ProjectRepositoryImplProvider extends $FunctionalProvider<
    ProjectRepositoryImpl,
    ProjectRepositoryImpl,
    ProjectRepositoryImpl> with $Provider<ProjectRepositoryImpl> {
  const ProjectRepositoryImplProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'projectRepositoryImplProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$projectRepositoryImplHash();

  @$internal
  @override
  $ProviderElement<ProjectRepositoryImpl> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ProjectRepositoryImpl create(Ref ref) {
    return projectRepositoryImpl(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProjectRepositoryImpl value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProjectRepositoryImpl>(value),
    );
  }
}

String _$projectRepositoryImplHash() =>
    r'193f8479e64433727d9aa4a154a29c51aa72a6b5';

@ProviderFor(saveProject)
const saveProjectProvider = SaveProjectProvider._();

final class SaveProjectProvider extends $FunctionalProvider<SaveProjectUseCase,
    SaveProjectUseCase, SaveProjectUseCase> with $Provider<SaveProjectUseCase> {
  const SaveProjectProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'saveProjectProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$saveProjectHash();

  @$internal
  @override
  $ProviderElement<SaveProjectUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveProjectUseCase create(Ref ref) {
    return saveProject(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveProjectUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveProjectUseCase>(value),
    );
  }
}

String _$saveProjectHash() => r'507675307fc80c41dab9e59306f49c034a5e2bb1';

@ProviderFor(getProjects)
const getProjectsProvider = GetProjectsProvider._();

final class GetProjectsProvider extends $FunctionalProvider<GetProjectsUseCase,
    GetProjectsUseCase, GetProjectsUseCase> with $Provider<GetProjectsUseCase> {
  const GetProjectsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getProjectsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getProjectsHash();

  @$internal
  @override
  $ProviderElement<GetProjectsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetProjectsUseCase create(Ref ref) {
    return getProjects(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProjectsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProjectsUseCase>(value),
    );
  }
}

String _$getProjectsHash() => r'277a8073e4733318649ca55c4890d69ed21b77e4';

@ProviderFor(getProject)
const getProjectProvider = GetProjectProvider._();

final class GetProjectProvider extends $FunctionalProvider<GetProjectUseCase,
    GetProjectUseCase, GetProjectUseCase> with $Provider<GetProjectUseCase> {
  const GetProjectProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getProjectProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getProjectHash();

  @$internal
  @override
  $ProviderElement<GetProjectUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetProjectUseCase create(Ref ref) {
    return getProject(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProjectUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProjectUseCase>(value),
    );
  }
}

String _$getProjectHash() => r'34fc69c563165bf3169974155598aae3dde66437';

@ProviderFor(saveProjectReview)
const saveProjectReviewProvider = SaveProjectReviewProvider._();

final class SaveProjectReviewProvider extends $FunctionalProvider<
    SaveProjectReviewUseCase,
    SaveProjectReviewUseCase,
    SaveProjectReviewUseCase> with $Provider<SaveProjectReviewUseCase> {
  const SaveProjectReviewProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'saveProjectReviewProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$saveProjectReviewHash();

  @$internal
  @override
  $ProviderElement<SaveProjectReviewUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveProjectReviewUseCase create(Ref ref) {
    return saveProjectReview(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveProjectReviewUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveProjectReviewUseCase>(value),
    );
  }
}

String _$saveProjectReviewHash() => r'92a7b5986f4adaead3c5e26540f84620072fc4e0';

@ProviderFor(getProjectReviews)
const getProjectReviewsProvider = GetProjectReviewsProvider._();

final class GetProjectReviewsProvider extends $FunctionalProvider<
    GetProjectReviewsUseCase,
    GetProjectReviewsUseCase,
    GetProjectReviewsUseCase> with $Provider<GetProjectReviewsUseCase> {
  const GetProjectReviewsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getProjectReviewsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getProjectReviewsHash();

  @$internal
  @override
  $ProviderElement<GetProjectReviewsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetProjectReviewsUseCase create(Ref ref) {
    return getProjectReviews(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProjectReviewsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProjectReviewsUseCase>(value),
    );
  }
}

String _$getProjectReviewsHash() => r'36184da1c8a65301a2b59f327ba8c23aedc231ee';

@ProviderFor(getProjectReview)
const getProjectReviewProvider = GetProjectReviewProvider._();

final class GetProjectReviewProvider extends $FunctionalProvider<
    GetProjectReviewUseCase,
    GetProjectReviewUseCase,
    GetProjectReviewUseCase> with $Provider<GetProjectReviewUseCase> {
  const GetProjectReviewProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getProjectReviewProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getProjectReviewHash();

  @$internal
  @override
  $ProviderElement<GetProjectReviewUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetProjectReviewUseCase create(Ref ref) {
    return getProjectReview(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProjectReviewUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProjectReviewUseCase>(value),
    );
  }
}

String _$getProjectReviewHash() => r'2f0aaa2efd3a5c28e84f8db96632efe52548811c';

@ProviderFor(getPaginatedBookmarks)
const getPaginatedBookmarksProvider = GetPaginatedBookmarksProvider._();

final class GetPaginatedBookmarksProvider extends $FunctionalProvider<
        GetUserProjectBookmarksUseCase,
        GetUserProjectBookmarksUseCase,
        GetUserProjectBookmarksUseCase>
    with $Provider<GetUserProjectBookmarksUseCase> {
  const GetPaginatedBookmarksProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getPaginatedBookmarksProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getPaginatedBookmarksHash();

  @$internal
  @override
  $ProviderElement<GetUserProjectBookmarksUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetUserProjectBookmarksUseCase create(Ref ref) {
    return getPaginatedBookmarks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetUserProjectBookmarksUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<GetUserProjectBookmarksUseCase>(value),
    );
  }
}

String _$getPaginatedBookmarksHash() =>
    r'4afd80e01131505697ac435afbf8fd385d90673d';

@ProviderFor(subToProjectNotif)
const subToProjectNotifProvider = SubToProjectNotifProvider._();

final class SubToProjectNotifProvider extends $FunctionalProvider<
    SubToProjectNotifUseCase,
    SubToProjectNotifUseCase,
    SubToProjectNotifUseCase> with $Provider<SubToProjectNotifUseCase> {
  const SubToProjectNotifProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'subToProjectNotifProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$subToProjectNotifHash();

  @$internal
  @override
  $ProviderElement<SubToProjectNotifUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SubToProjectNotifUseCase create(Ref ref) {
    return subToProjectNotif(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubToProjectNotifUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubToProjectNotifUseCase>(value),
    );
  }
}

String _$subToProjectNotifHash() => r'b291a1dd992869a364084ead0c3b858ca39b6007';

@ProviderFor(scheduleProject)
const scheduleProjectProvider = ScheduleProjectProvider._();

final class ScheduleProjectProvider extends $FunctionalProvider<
    ScheduleProjectUseCase,
    ScheduleProjectUseCase,
    ScheduleProjectUseCase> with $Provider<ScheduleProjectUseCase> {
  const ScheduleProjectProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'scheduleProjectProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$scheduleProjectHash();

  @$internal
  @override
  $ProviderElement<ScheduleProjectUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ScheduleProjectUseCase create(Ref ref) {
    return scheduleProject(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScheduleProjectUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScheduleProjectUseCase>(value),
    );
  }
}

String _$scheduleProjectHash() => r'92b6eeb0dc4bb039e784f9b256f4e7d738da469d';

@ProviderFor(toggleLike)
const toggleLikeProvider = ToggleLikeProvider._();

final class ToggleLikeProvider extends $FunctionalProvider<ToggleLikeUseCase,
    ToggleLikeUseCase, ToggleLikeUseCase> with $Provider<ToggleLikeUseCase> {
  const ToggleLikeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'toggleLikeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$toggleLikeHash();

  @$internal
  @override
  $ProviderElement<ToggleLikeUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ToggleLikeUseCase create(Ref ref) {
    return toggleLike(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToggleLikeUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToggleLikeUseCase>(value),
    );
  }
}

String _$toggleLikeHash() => r'6610dd1971c4bc0f3245dfa3b80af78912f3420a';

@ProviderFor(clearProjectBookmarks)
const clearProjectBookmarksProvider = ClearProjectBookmarksProvider._();

final class ClearProjectBookmarksProvider extends $FunctionalProvider<
    ClearProjectBookmarksUseCase,
    ClearProjectBookmarksUseCase,
    ClearProjectBookmarksUseCase> with $Provider<ClearProjectBookmarksUseCase> {
  const ClearProjectBookmarksProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'clearProjectBookmarksProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$clearProjectBookmarksHash();

  @$internal
  @override
  $ProviderElement<ClearProjectBookmarksUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ClearProjectBookmarksUseCase create(Ref ref) {
    return clearProjectBookmarks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ClearProjectBookmarksUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ClearProjectBookmarksUseCase>(value),
    );
  }
}

String _$clearProjectBookmarksHash() =>
    r'a18ee814aa1f6ffd4a4793d40d35f1569c32a55d';

@ProviderFor(reactToProjectReview)
const reactToProjectReviewProvider = ReactToProjectReviewProvider._();

final class ReactToProjectReviewProvider extends $FunctionalProvider<
    ReactToProjectReviewUseCase,
    ReactToProjectReviewUseCase,
    ReactToProjectReviewUseCase> with $Provider<ReactToProjectReviewUseCase> {
  const ReactToProjectReviewProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reactToProjectReviewProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reactToProjectReviewHash();

  @$internal
  @override
  $ProviderElement<ReactToProjectReviewUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReactToProjectReviewUseCase create(Ref ref) {
    return reactToProjectReview(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReactToProjectReviewUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReactToProjectReviewUseCase>(value),
    );
  }
}

String _$reactToProjectReviewHash() =>
    r'd89d5f9dd4106b72aeea78d1b5f3aa5610379004';

@ProviderFor(reactToProjectVetting)
const reactToProjectVettingProvider = ReactToProjectVettingProvider._();

final class ReactToProjectVettingProvider extends $FunctionalProvider<
    ReactToProjectVettingUseCase,
    ReactToProjectVettingUseCase,
    ReactToProjectVettingUseCase> with $Provider<ReactToProjectVettingUseCase> {
  const ReactToProjectVettingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'reactToProjectVettingProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$reactToProjectVettingHash();

  @$internal
  @override
  $ProviderElement<ReactToProjectVettingUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ReactToProjectVettingUseCase create(Ref ref) {
    return reactToProjectVetting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReactToProjectVettingUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReactToProjectVettingUseCase>(value),
    );
  }
}

String _$reactToProjectVettingHash() =>
    r'9e8923807419de17779357b2e98713dca75c9a94';

@ProviderFor(toggleBookmark)
const toggleBookmarkProvider = ToggleBookmarkProvider._();

final class ToggleBookmarkProvider extends $FunctionalProvider<
    ToggleBookmarkUseCase,
    ToggleBookmarkUseCase,
    ToggleBookmarkUseCase> with $Provider<ToggleBookmarkUseCase> {
  const ToggleBookmarkProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'toggleBookmarkProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$toggleBookmarkHash();

  @$internal
  @override
  $ProviderElement<ToggleBookmarkUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ToggleBookmarkUseCase create(Ref ref) {
    return toggleBookmark(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ToggleBookmarkUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ToggleBookmarkUseCase>(value),
    );
  }
}

String _$toggleBookmarkHash() => r'fd9ae908bd8bf0829edc5f463e5ea18cd68a05e3';

@ProviderFor(deleteProject)
const deleteProjectProvider = DeleteProjectProvider._();

final class DeleteProjectProvider extends $FunctionalProvider<
    DeleteProjectUseCase,
    DeleteProjectUseCase,
    DeleteProjectUseCase> with $Provider<DeleteProjectUseCase> {
  const DeleteProjectProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteProjectProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteProjectHash();

  @$internal
  @override
  $ProviderElement<DeleteProjectUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeleteProjectUseCase create(Ref ref) {
    return deleteProject(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteProjectUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteProjectUseCase>(value),
    );
  }
}

String _$deleteProjectHash() => r'b877c510c65d1a2eb25340af7864d168b1172672';

@ProviderFor(notInterestedProject)
const notInterestedProjectProvider = NotInterestedProjectProvider._();

final class NotInterestedProjectProvider extends $FunctionalProvider<
    MarkNotInterestedUseCase,
    MarkNotInterestedUseCase,
    MarkNotInterestedUseCase> with $Provider<MarkNotInterestedUseCase> {
  const NotInterestedProjectProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'notInterestedProjectProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$notInterestedProjectHash();

  @$internal
  @override
  $ProviderElement<MarkNotInterestedUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MarkNotInterestedUseCase create(Ref ref) {
    return notInterestedProject(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MarkNotInterestedUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MarkNotInterestedUseCase>(value),
    );
  }
}

String _$notInterestedProjectHash() =>
    r'92aea445fa33ab0605be36d8fbc78160e7822f61';

@ProviderFor(deleteProjectReview)
const deleteProjectReviewProvider = DeleteProjectReviewProvider._();

final class DeleteProjectReviewProvider extends $FunctionalProvider<
    DeleteProjectReviewUseCase,
    DeleteProjectReviewUseCase,
    DeleteProjectReviewUseCase> with $Provider<DeleteProjectReviewUseCase> {
  const DeleteProjectReviewProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteProjectReviewProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteProjectReviewHash();

  @$internal
  @override
  $ProviderElement<DeleteProjectReviewUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeleteProjectReviewUseCase create(Ref ref) {
    return deleteProjectReview(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteProjectReviewUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteProjectReviewUseCase>(value),
    );
  }
}

String _$deleteProjectReviewHash() =>
    r'f92fcf710e91a889cf0121808f37a00e373eb748';

@ProviderFor(deleteProjectVetting)
const deleteProjectVettingProvider = DeleteProjectVettingProvider._();

final class DeleteProjectVettingProvider extends $FunctionalProvider<
    DeleteProjectVettingUseCase,
    DeleteProjectVettingUseCase,
    DeleteProjectVettingUseCase> with $Provider<DeleteProjectVettingUseCase> {
  const DeleteProjectVettingProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteProjectVettingProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteProjectVettingHash();

  @$internal
  @override
  $ProviderElement<DeleteProjectVettingUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeleteProjectVettingUseCase create(Ref ref) {
    return deleteProjectVetting(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteProjectVettingUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteProjectVettingUseCase>(value),
    );
  }
}

String _$deleteProjectVettingHash() =>
    r'31a81ff881a2909ab7943df3a8fe40b33f05dfa2';

@ProviderFor(vetProject)
const vetProjectProvider = VetProjectProvider._();

final class VetProjectProvider extends $FunctionalProvider<VetProjectUseCase,
    VetProjectUseCase, VetProjectUseCase> with $Provider<VetProjectUseCase> {
  const VetProjectProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'vetProjectProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$vetProjectHash();

  @$internal
  @override
  $ProviderElement<VetProjectUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VetProjectUseCase create(Ref ref) {
    return vetProject(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VetProjectUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VetProjectUseCase>(value),
    );
  }
}

String _$vetProjectHash() => r'2d819f29e6abd9622c251523f9b445a2cb85ed39';

@ProviderFor(getVettedProject)
const getVettedProjectProvider = GetVettedProjectProvider._();

final class GetVettedProjectProvider extends $FunctionalProvider<
    GetVettedProjectUseCase,
    GetVettedProjectUseCase,
    GetVettedProjectUseCase> with $Provider<GetVettedProjectUseCase> {
  const GetVettedProjectProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getVettedProjectProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getVettedProjectHash();

  @$internal
  @override
  $ProviderElement<GetVettedProjectUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetVettedProjectUseCase create(Ref ref) {
    return getVettedProject(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetVettedProjectUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetVettedProjectUseCase>(value),
    );
  }
}

String _$getVettedProjectHash() => r'50a007e5e425e0c0e2b53c1dc643d69126170eed';

@ProviderFor(getVettedProjects)
const getVettedProjectsProvider = GetVettedProjectsProvider._();

final class GetVettedProjectsProvider extends $FunctionalProvider<
    GetVettedProjectsUseCase,
    GetVettedProjectsUseCase,
    GetVettedProjectsUseCase> with $Provider<GetVettedProjectsUseCase> {
  const GetVettedProjectsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getVettedProjectsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getVettedProjectsHash();

  @$internal
  @override
  $ProviderElement<GetVettedProjectsUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetVettedProjectsUseCase create(Ref ref) {
    return getVettedProjects(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetVettedProjectsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetVettedProjectsUseCase>(value),
    );
  }
}

String _$getVettedProjectsHash() => r'1b02c9a15613c3978265afe71745114ed76d20eb';

@ProviderFor(getProjectDraft)
const getProjectDraftProvider = GetProjectDraftProvider._();

final class GetProjectDraftProvider extends $FunctionalProvider<
    GetProjectDraftUseCase,
    GetProjectDraftUseCase,
    GetProjectDraftUseCase> with $Provider<GetProjectDraftUseCase> {
  const GetProjectDraftProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getProjectDraftProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getProjectDraftHash();

  @$internal
  @override
  $ProviderElement<GetProjectDraftUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetProjectDraftUseCase create(Ref ref) {
    return getProjectDraft(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetProjectDraftUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetProjectDraftUseCase>(value),
    );
  }
}

String _$getProjectDraftHash() => r'3cc4c60dbdef5bae77f090179223d58a60b0ef87';

@ProviderFor(saveProjectDraft)
const saveProjectDraftProvider = SaveProjectDraftProvider._();

final class SaveProjectDraftProvider extends $FunctionalProvider<
    SaveProjectDraftUseCase,
    SaveProjectDraftUseCase,
    SaveProjectDraftUseCase> with $Provider<SaveProjectDraftUseCase> {
  const SaveProjectDraftProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'saveProjectDraftProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$saveProjectDraftHash();

  @$internal
  @override
  $ProviderElement<SaveProjectDraftUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveProjectDraftUseCase create(Ref ref) {
    return saveProjectDraft(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveProjectDraftUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveProjectDraftUseCase>(value),
    );
  }
}

String _$saveProjectDraftHash() => r'7686d532f63383c0c09fa6242f7f124d1f37ab2d';

@ProviderFor(deleteProjectDraft)
const deleteProjectDraftProvider = DeleteProjectDraftProvider._();

final class DeleteProjectDraftProvider extends $FunctionalProvider<
    DeleteProjectDraftUseCase,
    DeleteProjectDraftUseCase,
    DeleteProjectDraftUseCase> with $Provider<DeleteProjectDraftUseCase> {
  const DeleteProjectDraftProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'deleteProjectDraftProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deleteProjectDraftHash();

  @$internal
  @override
  $ProviderElement<DeleteProjectDraftUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  DeleteProjectDraftUseCase create(Ref ref) {
    return deleteProjectDraft(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DeleteProjectDraftUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DeleteProjectDraftUseCase>(value),
    );
  }
}

String _$deleteProjectDraftHash() =>
    r'0f24e9c7305d30d7d8d64a0795c66562a338b43e';
